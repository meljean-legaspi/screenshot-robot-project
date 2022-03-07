|        *** Settings ***       |
| Documentation                 | Gets video of current screen.
| Library                       | OperatingSystem
| Library                       | DateTime
| Library                       | ScreenCapLibrary

|     *** Variables ***         |
| ${video_dir}                  | ${CURDIR}/Screen Videos
| ${log_message}                | Video directory does not exist. Creating directory.
| ${timestamp}                  |

|       *** Tasks ***           |
| Create Screenshot Directory   | [Documentation]                | Creates screenshot directory if not existing.   |
|                               | ${status}                      | ${value}=                                       | Run Keyword And Ignore Error            | Directory Should Exist   | ${video_dir}
|                               | Run Keyword Unless             | '${status}'=='PASS'                             | Log                                     | ${log_message}           |
|                               | Run Keyword If                 | '${status}'=='FAIL'                             | Create Directory                        | ${video_dir}             |
| Get Timestamp                 | [Documentation]                | Get current timestamp.                          |
|                               | ${timestamp} =                 | Get Current Date                                | result_format=timestamp
| Get Video of Open Window      | [Documentation]                | Takes screenshot of open window.                |
|                               | Set Screenshot Directory       | ${video_dir}                                    |
|                               | Sleep                          | 5 seconds                                       |
|                               | Start Video Recording          | name=${video_dir}/recording_${timestamp}        | embed=False
|                               | Sleep                          | 10 seconds                                      |
|                               | Stop Video Recording           |