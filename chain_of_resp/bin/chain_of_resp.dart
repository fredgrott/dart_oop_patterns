enum LogLevel {
  none,
  info,
  debug,
  warning,
  error,
  functionalMessage,
  functionalError,
}

abstract class Logger {
  Set<LogLevel> levels;
  late Logger _next;

  Logger(this.levels);

  bool get universal => levels.containsAll(LogLevel.values);
  set next(Logger nextLogger) => _next = nextLogger;

  void addLevel(LogLevel level) => levels.add(level);

  void log(LogLevel level, String msg) {
    if (levels.contains(level) || universal) {
      writeMessage(msg);
    } 
    _next.log(level, msg);
  }

  void writeMessage(String msg);
}

class ConsoleLogger extends Logger {
  ConsoleLogger(Set<LogLevel> levels) : super(levels);
  @override
  void writeMessage(String msg) => print("[Console]: $msg");
}

class EmailLogger extends Logger {
  EmailLogger(Set<LogLevel> levels) : super(levels);
  @override
  void writeMessage(String msg) => print("[Email]: $msg");
}

class FileLogger extends Logger {
  FileLogger(Set<LogLevel> levels) : super(levels);
  @override
  void writeMessage(String msg) => print("[File]: $msg");
}

void main() {
  var logger = ConsoleLogger(Set.from(LogLevel.values));
  var eLog = EmailLogger({LogLevel.functionalMessage, LogLevel.functionalError});
  var fLog = FileLogger({LogLevel.warning, LogLevel.error});

  logger.next = eLog;
  eLog.next = fLog;

  logger.log(LogLevel.debug, "Some amazingly helpful debug message");
  logger.log(LogLevel.info, "Pretty important information");

  logger.log(LogLevel.warning, "This is a warning!");
  logger.log(LogLevel.error, "AHHHHHHHHH!");

  logger.log(LogLevel.functionalError, "This is not a show stopper");
  logger.log(LogLevel.functionalMessage, "This is basically just info");

  /*
    [Console]: Some amazingly helpful debug message
    [Console]: Pretty important information
    [Console]: This is a warning!
    [File]: This is a warning!
    [Console]: AHHHHHHHHH!
    [File]: AHHHHHHHHH!
    [Console]: This is not a show stopper
    [Email]: This is not a show stopper
    [Console]: This is basically just info
    [Email]: This is basically just info
  */
}

