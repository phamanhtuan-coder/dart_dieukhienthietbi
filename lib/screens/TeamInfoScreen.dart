import 'package:flutter/material.dart';

class TeamInfoScreen extends StatelessWidget {
  final List<Member> members = [
    Member(name: 'Phạm Anh Tuấn - 0306221391', role: 'Trưởng nhóm'),
    Member(name: 'Phạm Xuân Nhân - 0306221358 ', role: 'Thành viên'),
    Member(name: 'Nguyễn Thanh Sang - 0306221369', role: 'Thành viên'),
    Member(name: 'Trương Duy Trọng - 0306221384', role: 'Thành viên'),
    Member(name: 'Văn Nam Cao - 0306221306', role: 'Thành viên'),
    Member(name: 'Nguyễn Mạnh Cường - 0306221309', role: 'Thành viên'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Thông tin nhóm',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Nhóm Anh Tuấn',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Mô tả',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Thành viên:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return Card(
                    child: ListTile(
                      title: Text(member.name, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                      subtitle: Text(member.role, style: const TextStyle(fontSize: 15)),
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
}

class Member {
  final String name;
  final String role;

  Member({required this.name, required this.role});
}