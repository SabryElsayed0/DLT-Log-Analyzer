# DLT Log Analyzer

## Overview
This repository contains a Bash script designed to automate the analysis of Diagnostic Log and Trace (DLT) files. The script provides functionalities to parse, filter, and summarize log data, focusing on identifying common errors, warnings, and specific event occurrences within the log files.

## Sample DLT Log Content
Example of the content within a DLT log file:
```
[2024-04-06 08:15:32] INFO System Startup Sequence Initiated
[2024-04-06 08:15:34] WARN Deprecated API usage detected: api_v1_backup
[2024-04-06 08:16:01] ERROR Unable to initialize network interface: eth0
[2024-04-06 08:16:05] INFO Network interface initialized successfully: eth1
[2024-04-06 08:17:42] DEBUG Process A started with PID: 1234
[2024-04-06 08:18:03] WARN Memory usage exceeds threshold: 85%
[2024-04-06 08:19:10] ERROR Disk write failure on device: /dev/sda1
[2024-04-06 08:20:00] INFO System health check OK
```

## Project Features
- **Log Parsing:** Extracts key information from each log entry, including timestamp, log level (INFO, WARN, ERROR, DEBUG), and the message.
- **Filtering:** Allows users to filter log entries by log level, enabling focus on specific types of messages (e.g., ERROR and WARN level messages).
- **Error and Warning Summary:** Summarizes errors and warnings by providing counts and details for each type encountered in the log.
- **Event Tracking:** Tracks specific events (e.g., "System Startup Sequence Initiated" and "System health check OK") to ensure critical processes start and complete as expected.
- **Report Generation:** Generates a report summarizing findings, including identified trends in error/warning logs and the status of system events.

## Get Started
To begin using the DLT Log Analyzer:
1. Clone this repository to your local machine.
2. Ensure you have Bash installed.
3. Navigate to the directory containing the script.
4. Run the script with appropriate permissions.

## Contributions
We welcome contributions! If you have any ideas for improvements or spot any bugs, feel free to open an issue or submit a pull request.

Happy log analyzing!
