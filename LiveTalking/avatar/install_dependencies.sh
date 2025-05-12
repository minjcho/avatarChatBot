#!/bin/bash

# Install required Python packages
pip install livekit==1.0.7
pip install livekit-agents==1.0.20
pip install requests
pip install python-dotenv
pip install pandas
pip install protobuf>=4.25.0
pip install types-protobuf>=3
pip install aiofiles>=24
pip install numpy>=1.26
pip install aiohttp~=3.10
pip install av>=12.0.0
pip install click~=8.1
pip install colorama>=0.4.6
pip install docstring-parser>=0.16
pip install eval-type-backport
pip install livekit-api<2,>=1.0.2
pip install livekit-protocol~=1.0
pip install nest-asyncio>=1.6.0
pip install psutil>=7.0

# 자동 패치: tts_patch.py를 livekit-agents 소스에 복사
cp tts_patch.py /Users/minjcho/development/library/agents/livekit-agents/livekit/agents/tts/tts.py
