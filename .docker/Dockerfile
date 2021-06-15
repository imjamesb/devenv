FROM ubuntu:20.10

# Update APT cache and indexing.
RUN apt update
RUN apt upgrade -y

# Install curl.
RUN apt install -y curl

# Install Docker Compose.
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install Docker Community Engine.
RUN apt install -y apt-transport-https ca-certificates gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update
RUN apt install -y docker-ce docker-ce-cli containerd.io

# Install Other Packages.
RUN apt install -y build-essential musl-dev libssl-dev libssh-dev git htop zsh exa bat wget httpie neofetch vim nano

# Install Starship.rs.
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y

# Install Oh My Zsh.
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended

# Install Oh My Zsh Plugins.

## Zsh Syntax Highlighting.
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## Zsh Autosuggestions.
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Change the default shell to zsh.
RUN chsh -s "$(which zsh)"

# Cleanup.
RUN rm -rf /root/.zshrc /root/.bashrc /root/.bash_history /root/.profile

# Zsh Config.
COPY ./.zshrc /root/.zshrc

WORKDIR /root

CMD [ "zsh" ]
