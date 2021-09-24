

5. 정규식(regex)을 이용한 패턴 연산
   : 검색 패턴 기호를 사용하여 원하는 특정한 패턴을 찾거나 
     변환 및 특정한 패턴에 부합하는지 유효성 검증을 위해 사용

   https://ko.wikipedia.org/
   https://regexr.com/
   https://regexlib.com/
   https://regexone.com/
   http://zvon.org/comp/r/tut-Regexp.html#Pages~Contents


    [Groups and ranges]
    |	또는
    ()	그룹
    []	문자셋, 괄호안의 어떤 문자든
    [^]	부정 문자셋, 괄호안의 어떤 문가 아닐때
    (?:)	찾지만 기억하지는 않음

    
    [Quantifiers]
    ?	없거나 있거나 (zero or one)
    *	없거나 있거나 많거나 (zero or more)
    +	하나 또는 많이 (one or more)
    {n}	n번 반복
    {min,}	최소
    {min,max}	최소, 그리고 최대


    [Boundary-type]
    \b	단어 경계
    \B	단어 경계가 아님
    ^	문장의 시작
    $	문장의 끝


    [Character classes]
    \	특수 문자가 아닌 문자
    .	어떤 글자 (줄바꿈 문자 제외)
    \d	digit 숫자
    \D	digit 숫자 아님
    \w	word 문자
    \W	word 문자 아님
    \s	space 공백
    \S	space 공백 아님

--SAMPLE DATA------------------------------------------------------

동해물과 백두산이 마르고 닳도록

Hi there, Nice to meet you. And Hello there and hi.
I love grey(gray) color not a gry, graay and graaay. grdy
Ya ya YaYaYa Ya

사전
[1] 가
[2] 나
[3] 다

abcdefghijklmnopqrstuvwxyz
ABSCEFGHIJKLMNOPQRSTUVWZYZ
1234567890

.[]{}()\^$|?*+

010-8985-0893
010 8983 0893
010.8988.8933
010-4055-3412
02-878-8888
070-8787-8888

call1212@narospace.com
call121233@gmail.com
hello@live.co.kr

http://www.youtu.be/-ZClicWm0zM
https://www.youtu.be/-ZClicWm0zM
https://youtu.be/-ZClicWm0zM
youtu.be/-ZClicWm0zM



> 한글 검색 :
했음!


> 전화번호 패턴 검색 :
    
했음!

> email 패턴 검색 :
    
했음!

> 유튜브주소로부터 비디오 ID 추출 :
    


---------------------------------------------------------------

> lecture.member 테이블에서 유효하지 않은 번호(PHONE)만 조회


    
---------------------------------------------------------------


