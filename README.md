# Flutter

인프런 코드팩토리 [플러터 중급강의]
---

##### 섹션 1 - 기본 UI 작업하기
##### 섹션 2 - Authentication (인증 시스템) / 23.05.26 완료
 * refresh token, access token
##### 섹션 3 - 페이지네이션 / 23.05.30 완료
 * page based pagination, cursor based pagination
##### 섹션 4 - 데이터모델링 / 23.05.30 완료
 * 모델링 복습하기
 * ? RestaurantDetailModel에서 super를 이용해서 RestaurantModel의 속성을 그대로 사용한 이유
##### 섹션 5 - RestaurantDetailScreen 작업하기 / 23.05.31 완료
##### 섹션 6 - JsonSerializable과 Retrofit 그리고 Dio Interceptor / 23.06.01 완료
 * json_serializable : JsonSerializable 어노테이션을 활용한 클래스 인스턴스의 직렬화 및 역직렬화 + JsonKey 어노테이션과 정적 메소드 활용
 * live template : 동일하게 반복되는 코드를 live templates에 등록하고 자동완성 기능으로 손쉽게 재활용하는 기능
 * retrofit : 제너릭 사용하는 과정 이해하기
 * dio interceptor : 요청, 에러, 응답 등의 상황에서 토큰을 핸들링함.
 * ? genericArgumentFactories, T Function(Object? json) fromJsonT
##### 섹션 7 - Riverpod을 이용한 상태관리 / 23.06.07 완료
 * 1 - riverpod (메인 최상위 루트에서 ProviderScpoe를 활용해 상태관리함), 스크린이 변경되어도 watch를 하고 있다면 동일한 데이터를 가리킴
 * family_modifier는 provider 생성 시 생성 순간에 어떤 변수를 입력하고 provider 안의 로직을 변경할 때 사용(캐싱)
 * autoDisposeModifier는 자동으로 캐시 삭제(처음부터 다시 생성)
##### 섹션 8 - Riverpod v2 추가 강의 / 23.06.07 완료
 * Provider 코드 자동생성 지원 (함수형태라 직관적임)
##### 섹션 9 - 상태관리 프로젝트에 적용하기 23.06.07 완료
##### 섹션 10 - 캐시관리 및 공유하기 / 23.06.07 완료
 * 리스트에서 상세보기 들어갈 때 리스트에 있는 데이터 캐싱하기
 * 리스트에서의 사진을 상세 화면으로 캐싱하여 가져오는 Hero, 로딩을 세련되게 표출하는 Skeletons
##### 섹션 11 - Pagination 일반화하기 / 23.06.10 완료
 * RestAPI 클래스 생성하는 부분 복습하기
 * dart에서는 제네릭 안에서 implements 사용 불가(인터페이스이더라도) extends 사용해야함
##### 섹션 12 - 고급 캐시관리 / 23.06.11 완료
 * OOP를 이용한 일반화.. 리스트 뷰 커스터마이징.. 
##### 섹션 13 - [Go Router v7] GoRouter 이론 / 23.06.12 완료
 * GoRouter는 경로를 지정한 여러개의 화면으로 이동을 할 수 있으며, GoRouterState를 통해 현재 Router의 location(경로)와 같은 상태도 가져옴
 * push 와 go의 차이를 분명하게 기억하기. go는 router에 nesting한 루트순으로 동작하며, push는 router에 등록한 루트가 아닌 실행되는 화면을 기준으로 동작함.
 * pop을 통해 뒤로가기를 하며, 뒤로가기를 하면서 파라미터를 이용하여 값을 반환해줄 수도 있음. (뒤로가기하여 열린 화면에서 활용하려는 의도)
 * ShellRouter - 하나의 화면에서 네비게이션탭바와 같이 여러가지 라우터를 활용하려는 경우 사용. 상위 위젯을 중심으로 index를 이용해서 child 라우터를 지정.
 * parameter, query, redirect 등 url의 파라미터를 이용한 로직도 구현 가능.
##### 섹션 14 - [Go Router v4] GoRouter 이론 / 건너뜀
##### 섹션 15 - GoRouter 프로젝트에 적용하기 / 23.06.14 완료
##### 섹션 16 - Optimistic Response / 23.06.15 완료
 * 긍정적 응답 - 응답이 성공할 거라고 가정하고 UI의 상태를 먼저 업데이트함.
##### 섹션 17 - 장바구니 스크린 / 23.06.16 완료
##### 섹션 18 - 주문 탭 / 23.06.16 완료
##### 섹션 19 - Debounce와 Throttle 
 * https://rxmarbles.com/ <- Debounce와 Throttle 쉽게 보여주는 사이트
 * 1프레임 내에 요청이 추가로 들어가는 경우를 막기 위해 필요함. 이럴 때는 Throttle 사용해서 실행 시 추가 요청을 일정기간동안 막음.
