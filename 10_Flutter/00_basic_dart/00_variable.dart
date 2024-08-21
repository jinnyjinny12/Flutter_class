/*
    다트의 변수
    다트에서는 변수의 종류가 여러 가지 있으며, 각 변수는 특정 데이터 타입에 따라 다르게 사용한다.
    다트는 정적 타입 언어이지만, 타입 추론을 지원하며 변수 타입을 명시하지 않고도 사용할 수 있다.
    주요 변수의 종류는 기본타입, 컬ㅔㄱ션, 그고 사용자 정의 타입으로 나눌 수 있다.

 */


// 기본데이터 타입

int age = 16;
double height = 17.5;
String name = "john";
bool isStudent = true;


//2. 컬렉션
List<String> fruits = ['사과','바나나','오렌지'];
Map<String,int> scores = {"수학":90, '영어':85};
Set<int> uniqueMembers = {1, 2, 3, 4, 5, 1,2,3,4,5,};
// 중복된 것을 방지하는 것 : set 의 특징


// 3. 사용자 정의 타입
class Car {
    String brand;
    String model;

    // 생성자
    Car({required this.brand, required this.model});

}

// 프로그램 실행
void main(){

    print("나이 :$age");
    print("첫번 째 과일 : ${fruits[0]}");

    Car myCar = Car(brand: "kia", model: "K5");

    Car myCar2 = Car(model: "K5", brand: "kia");

    print("$myCar 는 ${myCar.brand} 사의 ${myCar.model} 입니다." ); 
    print("$myCar2 는 ${myCar2.brand} 사의 ${myCar2.model} 입니다."); 

}






