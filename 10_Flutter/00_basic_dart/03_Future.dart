import 'dart:ffi';

/**
 * Future
 * Future 은 다트에서 비동기 프로그래밍을 지원하기 위해서 제공되는 클래스이다.
 * 비동기 작업이 완료될 떄까지 기다리지 않고 다른 작업을 시작할 수 있게 해주며,
 * 비동기 작업의 결과를 나중에 사용할 수 있도록 한다. Future 는 주로 네트워크 요청, 
 * 파일 1/0, 타이머 등 시간이 걸리는 작업에 사용된다.
 * 
 * 비동기함수: async 키워드로 정의된 함수에서 futrue 를 반환한다.
 * 결과 처리: await 를 사용하여 Future 의 완료를 기다리거나, then 메서드를 사용하여 결과를 처리한다.
 * 오류 처리: catchError  메서드를 통해 비동기 작업에서 발생한 오류를 처리할 수 있다.
 * Future 는 다트의 비동기 프로그래밍에서 중요한 역할을 하며 사용자 경험을 향상시키는 데 큰 도움이 된다.
 * 비동기 작업을 효율적으로 관리하고 코드 가독성을 높이는 데 기여한다.  
 * 
 */



// 1. 비동기 함수 정의

Future<String> fetchData() async{
    // throw Exception("확인");



  await Future.delayed(Duration(seconds: 2)); // url
  return "데이터 로드 완료";

}

void main() async{
  // String result = await fetchData();
  // print(result);

  fetchData().then((value) {
    print(value);
  }).catchError((error){
    print(error);
  });


}




