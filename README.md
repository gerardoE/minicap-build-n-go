# Build image (inside dir with Dockerfile)
`docker build --rm=false -t minicap-build-n-go .`

# Run image 
`docker run -p 9002:9002 --name minicap -w /minicap --rm -it minicap-build-n-go bash `

# Run cmds from image
`./streamers.sh \<ip\>:5555`





