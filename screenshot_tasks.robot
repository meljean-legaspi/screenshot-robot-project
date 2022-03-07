|      *** Settings ***       |
| Documentation               | Handles screenshot tasks.
| Library                     | OperatingSystem
| Library                     | ScreenCapLibrary

|     *** Variables ***       |
| ${screenshot_dir}           | ${CURDIR}/Screenshots
| ${log_message}              | Screenshot directory does not exist. Creating directory.
| ${delay}                    | 10sec

|       *** Tasks ***         |
| Create Screenshot Directory | [Documentation]              | Creates screenshot directory if not existing.  |
|                             | ${status}                    | ${value}=                                      | Run Keyword And Ignore Error | Directory Should Exist   | ${screenshot_dir}
|                             | Run Keyword Unless           | '${status}'=='PASS'                            | Log                          | ${log_message}           |
|                             | Run Keyword If               | '${status}'=='FAIL'                            | Create Directory             | ${screenshot_dir}        |
| Screenshot Open Window      | [Documentation]              | Takes screenshot of open window.               |
|                             | Set Screenshot Directory     | ${screenshot_dir}                              |
|                             | Take Screenshot              | name=${screenshot_dir}/current.jpg             | delay=${delay}