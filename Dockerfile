FROM python:3.8-slim-bookworm

WORKDIR /urs/src/app

RUN apt-get update && apt-get install -y pandoc git-lfs

RUN git clone https://gitlab.com/diogoalmiro/iris-lfs-storage.git
RUN cd iris-lfs-storage && git lfs pull
RUN mv iris-lfs-storage/descritores.pth .

RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . . 

EXPOSE 8999

CMD ["python", "server.py"]
