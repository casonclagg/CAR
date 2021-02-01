FROM pytorch/pytorch:1.3-cuda10.1-cudnn7-runtime

RUN apt-get clean \
        && apt-get update \
        && apt-get install -y ffmpeg git curl imagemagick \
        && apt-get -y autoremove

ENV MODELS="/content/models" 
ENV INPUT="/content/input"
ENV OUTPUT="/content/output"

# Install python requirements
WORKDIR /content
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy this repo to container
COPY . .

RUN cd adaptive_gridsampler \
  && python3 setup.py build_ext --inplace

CMD ["/bin/bash"]