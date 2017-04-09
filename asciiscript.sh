tput setaf 54
echo "                                    ▄▄▄▄▄▄"
echo "                                  ▄▓▀    ▓▓▓██▄▄"
echo "                               ▄▄▓▓  ▄▄▓▀▀     ▀▓▄"
echo "                             ▄▓▀ ▓▌ ▐▓  ▄▄█▀▓▓▄  ▓▌"
echo "                            ▐▓▌  ▓▌ ▐▓█▀▀▀▄▄  ▀▀▓▓▌"
echo "                             ▓▌  ▓▌ ▐▌    ▐▓▀█▄  ▀▓▄"
echo "                              ▓▓▄ ▀▀▀▓▄  ▄▄▓  ▓▌  ▓▌"
echo "                              ▓▌▀▀▓▄▄▄▄▓▀ ▐▓  ▓▌ ▄▓▀"
echo "                              ▀▓▄   ▀▀  ▄▄▓▀ ▐▓▓▓▀"
echo "                                ▀▓▄▄▄▄▓▀▀    ▓▓"
echo "                                      ▀▓▓▓▓▓▀▀"
echo "      ▄▄▄▓▓▄▄▄                                          ▄▄▄      ████████"
echo "    ▄▓▓▀▀  ▀▀▓▓▄                                       ▓▓▀▓▌        ▓▓▌"
echo "    ▓▓▌      ▐▓▓  ▓▓▄▓▓▓▓▓▄   ▄▓▓▀█▓▄   ▓▓▄▓▓▓▓▓▄     ▓▀  ▓▓▄       ▓▓▌"
echo "    ▓▓▌      ▐▓▓  ▓▓    ▀▓▓  ▓▓▌    ▓▓  ▓▓▌   ▐▓▓    ▐▓▌   ▓▓       ▓▓▌"
echo "    ▓▓▌      ▐▓▓  ▓▌    ▐▓▓  ▓▓▓██████  ▓▓▌   ▐▓▓   ▐▓▓▄▄▄▄▓▓▓      ▓▓▌"
echo "    ▀▓▓▄    ▄▓▓▀  ▓▓▄   ▄▓▓  ▓▓▌    ▄▄  ▓▓▌   ▐▓▓   ▓▓▀▀▀▀▀▀▓▓▌     ▓▓▌"
echo "      ▀▀█▓▓█▀▀    ▓▌▀████▀    ▀▀█▓██▀   ▓▓▌   ▐▓▓  ██▀       ██  ████████"
echo "                  ▓▌                                                     "
echo "                  ▓▌                                                     "
tput sgr0
echo
echo "Setting up Gym & dependencies. Takes 4-20 minutes, based on internet speed."
read -rsp $'>> Press enter to begin <<\n'

echo 
echo "**** OPENAI GYM SETUP SCRIPT ****"
echo "(Part 1) OpenAIGym folder"
echo "*********************************"
echo
sleep 1
dir="OpenAIGym"
if [ "${PWD##*/}" != $dir ]; then 
     if [ ! -d $dir ]; then
          mkdir $dir
     fi
     cd "$dir"
fi

echo "(Part 1) Success!"
echo; echo "**** OPENAI GYM SETUP SCRIPT ****"
echo "(Part 2) Setup Homebrew"
echo "*********************************"; sleep 1; echo
echo "Reaching out to Homebrew..."

which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing Homebrew. Enter your system password at prompt, then press enter."
    echo "(Tip) You will have a few minutes to grab coffee."
    sleep 8
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi
echo "(Part 2) Success!"
echo; echo "**** OPENAI GYM SETUP SCRIPT ****"
echo "(Part 3) Setup Python 3 / Conda"
echo "(Tip) Say yes to each prompt that asks"
echo "(Tip) Scroll down the license by pressing enter"
echo "*********************************"; echo
read -rsp $'>> Press enter to continue <<\n'
echo "Installing Miniconda..."

which -s conda 
if [[ $? != 0 ]] ; then
    # Install conda
    brew install wget
    wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    chmod +x Miniconda3-latest-MacOSX-x86_64.sh
    ./Miniconda3-latest-MacOSX-x86_64.sh
    rm Miniconda3-latest-MacOSX-x86_64.sh
    source ~/.bash_profile
else
    conda update conda
fi

echo "(Part 3) Success!"
echo; echo "**** OPENAI GYM SETUP SCRIPT ****"
echo "Part 4 | Install OpenAI Gym"
echo "*********************************"; sleep 1; echo

pip install 'gym[all]'

echo "(Part 4) Success!"
echo;echo "**** OPENAI GYM SETUP SCRIPT ****"
echo "Part 5 | Install Gym Dependencies"
echo "*********************************"; sleep 1; echo

brew install cmake boost boost-python sdl2 swig

echo "(Part 5) Success!"
echo; echo "**** OPENAI GYM SETUP SCRIPT ****"
echo "Part 6 | Download and run an example agent"
echo "*********************************"; sleep 1; echo
wget -c https://raw.githubusercontent.com/andrewschreiber/scripts/master/example_safety_agent.py
# Q: How many sample agents should we download?
# A: One for each exercise. Perhaps with hyperparameters generated by random.

read -rsp $'>> Press enter to start example_safety_agent <<\n'
python example_safety_agent.py

