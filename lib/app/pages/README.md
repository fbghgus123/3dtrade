# Pages

모든 페이지들은 해당 폴더에 존재해야합니다.
각 페이지들은 아래 요소들을 포함합니다.

- View
- controller
- binding

각 프로바이더에 맞게 미들웨어들을 설정할 수 있습니다.
GetView 혹은 GetResponsiveView를 stateless widget 대신 사용해주세요

# 페이지 추가시 해야할 일

페이지를 추가하려면 아래 작업들을 해주셔야 합니다.

- pages 폴더에 전용 폴더 만들기

  - 각 폴더는 위 요소들을 포함해야합니다.

- constants/app.paths 에 경로 추가하기

- app.routing.dart 파일에 라우팅 추가하기
