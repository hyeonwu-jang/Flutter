# Flutter

인프런 코드팩토리 [플러터 중급강의]
---

##### 섹션1 - 기본 UI 작업하기
##### 섹션2 - Authentication (인증 시스템) / 23.05.26 완료
 * refresh token, access token
##### 섹션3 - 페이지네이션 / 23.05.30 완료
 * page based pagination, cursor based pagination
##### 섹션4 - 데이터모델링 / 23.05.30 완료
 * 모델링 복습하기
 * ? RestaurantDetailModel에서 super를 이용해서 RestaurantModel의 속성을 그대로 사용한 이유
##### 섹션5 - RestaurantDetailScreen 작업하기 / 23.05.31 완료
##### 섹션6 - JsonSerializable과 Retrofit 그리고 Dio Interceptor / 23.06.01 완료
 * json_serializable : JsonSerializable 어노테이션을 활용한 클래스 인스턴스의 직렬화 및 역직렬화 + JsonKey 어노테이션과 정적 메소드 활용
 * live template : 동일하게 반복되는 코드를 live templates에 등록하고 자동완성 기능으로 손쉽게 재활용하는 기능
 * retrofit : 제너릭 사용하는 과정 이해하기
 * dio interceptor : 요청, 에러, 응답 등의 상황에서 토큰을 핸들링함.
 * ? genericArgumentFactories, T Function(Object? json) fromJsonT
##### 섹션7 - Riverpod을 이용한 상태관리 23.06.07 완료
 * 1 - riverpod (메인 최상위 루트에서 ProviderScpoe를 활용해 상태관리함), 스크린이 변경되어도 watch를 하고 있다면 동일한 데이터를 가리킴
 * family_modifier는 provider 생성 시 생성 순간에 어떤 변수를 입력하고 provider 안의 로직을 변경할 때 사용(캐싱)
 * autoDisposeModifier는 자동으로 캐시 삭제(처음부터 다시 생성)
##### 섹션8 - Riverpod v2 추가 강의 23.06.07 완료
 * Provider 코드 자동생성 지원 (함수형태라 직관적임)
##### 섹션9 - 상태관리 프로젝트에 적용하기 23.06.07 완료
##### 섹션10 - 캐시관리 및 공유하기 23.06.07 완료
 * 리스트에서 상세보기 들어갈 때 리스트에 있는 데이터 캐싱하기
 * 리스트에서의 사진을 상세 화면으로 캐싱하여 가져오는 Hero, 로딩을 세련되게 표출하는 Skeletons
##### 섹션11 - Pagination 일반화하기
