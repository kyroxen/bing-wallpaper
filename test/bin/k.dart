import 'dart:io';

Future<void> main() async {
  // print("Version 1: ");
  // print('');
  // var process = await Process.start('ls', ['-l']);
  // var exitCode = await process.exitCode;
  // print('exit code: $exitCode');

  print(Directory.current.toString());
  print('');
  Process.run('ls', ['-l']).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}
