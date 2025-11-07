import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'userinfo.dart';

class MessagesScreen extends StatefulWidget {
  final UserInfo userInfo;

  const MessagesScreen({super.key, required this.userInfo});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> _messages = [];

  // добавление сообщения
  Future<void> _addMessage() async {
    if (_textController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, введите текст сообщения')),
      );
      return;
    }

    try {
      await Supabase.instance.client.from('messages').insert({
        'text': _textController.text,
        'username': widget.userInfo.getName(),
        'created_at': DateTime.now().toIso8601String(),
      });

      // очистка поля после успешного добавления
      _textController.clear();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Сообщение добавлено успешно!')),
      );

      // обновление списка
      _loadMessages();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка при добавлении: $e')));
    }
  }

  // загрузка всех сообщений
  Future<void> _loadMessages() async {
    try {
      final response = await Supabase.instance.client
          .from('messages')
          .select()
          .order('created_at', ascending: false);

      setState(() {
        _messages = List<Map<String, dynamic>>.from(response);
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка при загрузке: $e')));
    }
  }

  // удаление сообщения
  Future<void> _deleteMessage(String id) async {
    try {
      await Supabase.instance.client.from('messages').delete().eq('id', id);

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Сообщение удалено')));

      // обновление списка после удаления
      _loadMessages();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка при удалении: $e')));
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('user_id');
    await prefs.remove('age');
    await prefs.remove('gender');

    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'Messenger'),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    // загрузка сообщений при запуске приложения
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сообщения - ${widget.userInfo.getName()}'),
        backgroundColor: const Color.fromARGB(255, 0, 194, 110),
        foregroundColor: const Color.fromARGB(255, 70, 70, 70),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // форма ввода
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: 'Текст сообщения',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _addMessage,
                            icon: const Icon(Icons.add),
                            label: const Text('Добавить'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _loadMessages,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Загрузить'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: const Color.fromARGB(
                                255,
                                18,
                                123,
                                34,
                              ),
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // заголовок списка
            Row(
              children: [
                const Text(
                  'Список сообщений',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Всего: ${_messages.length}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // список сообщений
            Expanded(
              child: _messages.isEmpty
                  ? const Center(
                      child: Text(
                        'Нет сообщений',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 12, 191, 78),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // username
                            title: Text(
                              message['username']?.toString() ?? 'Без имени',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            // текст сообщения
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['text']?.toString() ?? 'Без текста',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ID: ${message['id']}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () =>
                                  _deleteMessage(message['id'].toString()),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // очистка контроллеров при удалении виджета
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
