# 가상 아바타 화상 음성 대화 시스템

## 개요
본 시스템은 인공지능 기반 가상 아바타와 실시간으로 대화할 수 있는 화상 음성 대화 플랫폼입니다. Wav2Lip 모델을 활용하여 음성에 맞춰 자연스러운 입 움직임을 생성하는 가상 아바타를 구현했습니다. 사용자는 텍스트 또는 음성으로 질문을 입력하면, 아바타가 실시간으로 응답하며 적절한 립싱크와 함께 대화를 이어갑니다.

## 실행 방법

### 1. 아바타 서비스 준비
아래 명령어를 순서대로 실행하여 아바타 서비스를 준비합니다.
```bash
cd ~/LiveTalking/avatar
make
make dev

./patch_tts_in_container.sh
```

### 2. 스트리밍 서버 실행
다음 명령어로 SRS(Simple RTMP Server) 스트리밍 서버를 실행합니다.
```bash
docker run --rm --env CANDIDATE=$CANDIDATE -p 1935:1935 -p 8080:8080 -p 1985:1985 -p 8000:8000/udp registry.cn-hangzhou.aliyuncs.com/ossrs/srs:5 objs/srs -c conf/rtc.conf
```

### 3. 아바타 애플리케이션 실행
Wav2Lip 모델을 사용하여 아바타 애플리케이션을 실행합니다.
```bash
python app.py --transport rtcpush --push_url 'http://localhost:1985/rtc/v1/whip/?app=live&stream=livestream' --model wav2lip --avatar_id sb_256_5s --siren
```

### 4. 웹 인터페이스 접속
아래 URL을 통해 대화 인터페이스에 접속할 수 있습니다:
- **음성 채팅**: [https://infobank-seven.vercel.app/](https://infobank-seven.vercel.app/)
- **립싱크 서버**: [http://localhost:8010/rtcviewer.html](http://localhost:8010/rtcviewer.html)

## 주요 기술 구성 요소
- **Wav2Lip**: 오디오 입력에 맞춰 자연스러운 립싱크를 생성하는 딥러닝 모델.
- **WebRTC**: 브라우저 간 실시간 통신을 위한 기술.
- **SRS(Simple RTMP Server)**: 실시간 스트리밍을 위한 미디어 서버.

## 문제 해결
- **스트리밍 연결 오류**: 방화벽 설정과 포트(1935, 8080, 1985, 8000)가 열려 있는지 확인하세요.
- **아바타 렌더링 문제**: GPU 드라이버가 최신 버전인지 확인하고, 다른 `avatar_id` 값을 시도해보세요.
- **음성 인식 오류**: 마이크 설정을 확인하고, 조용한 환경에서 테스트하세요.

## 아바타 예시

## 아바타 동영상 예시
<video controls>
  <source src="./avatar.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
