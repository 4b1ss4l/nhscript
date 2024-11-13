#!/bin/bash

while true; do
    # Limpa o terminal
    clear

    # Exibe a tipografia "NH" em azul escuro
    echo -e "\e[34m<3<3             <3        <3\e[0m"
    echo -e "\e[34m<3   <3          <3        <3\e[0m"
    echo -e "\e[34m<3      <3       <3<3<3<3<3\e[0m"
    echo -e "\e[34m<3         <3    <3        <3\e[0m"
    echo -e "\e[34m<3           <3  <3        <3\e[0m"
    echo -e "\e[34m<3             <3<3        <3\e[0m"

    # Informações e opções
    echo ""
    echo -e "\e[36mProject by 4b1ss4l // Beta version!\e[0m"
    echo -e "\e[32mEnter a number...\e[0m"
    echo -e "\e[36m[1] RANDOM // Takes you to a random Nhentai page\e[0m"
    echo -e "\e[36m[2] SPECIFIC // You enter a page number\e[0m"
    echo -e "\e[36m[3] LATEST // Go to the latest Nhentai upload\e[0m"
    echo -e "\e[36m[4] POPULAR // Go to the popular section\e[0m"
    echo -e "\e[36m[5] SEARCH // Search by tag or a keyword\e[0m"
    echo -e "\e[36m[6] UPDATE SCRIPT // Update script from the GitHub repository\e[0m"
    echo -e "\e[36m[7] INFO OPTIONS // Displays information about the script and options\e[0m"
    echo -e "\e[36m[8] RANDOM TAG // Get a random tag and search for it\e[0m"
    echo -e "\e[36m[9] EXIT // Exit the script\e[0m"
    echo -e "\e[36m[10] RANDOM IMAGE // Go to a random image from Nhentai\e[0m"

    # Lê a opção do usuário
    echo -e "\e[32mSelect an option: \e[0m\c"
    read option

    case $option in
        1)
            termux-open-url "https://nhentai.net/random"
            ;;
        2)
            echo -e "\e[34mEnter a number from 1-190,000: \e[0m\c"
            read page_number
            termux-open-url "https://nhentai.net/g/$page_number/"
            ;;
        3)
            termux-open-url "https://nhentai.net/?sort=recent"
            ;;
        4)
            termux-open-url "https://nhentai.net/?sort=popular"
            ;;
        5)
    echo -e "\e[32mPopular Tags (Press Enter to go back): \e[0m"

    # Lista de tags populares
    tags=("Anal" "Harem" "Vanilla" "Bukkake" "BDSM" "Futanari" "Femdom" "Yaoi" "Yuri" "Tentacle" 
    "Cuckold" "Coping" "NTR" "Incest" "Lactation" "Mobility" "Toys" "Group" "Crossover" "Manga" 
    "Cream pie" "Big Tits" "Blowjob" "Furry" "Females" "Futas" "Futanari Male" "Domination" "Loli" 
    "Shota" "18+" "Mature" "Pet Play" "Fisting" "Threesome" "Yuri-on-Yuri" "Tentacles" "Mindbreak" "Whipping" "Bestiality" "Storyline" "Bondage" "Spanking" "Groping" "Massage" "Pee" 
    "Public" "Cowgirl" "MILF" "Shemale" "Hentai Girls" "Masturbation" "Crossdressing" "Striptease" 
    "Golden Shower" "Oral" "Choking" "Giantess" "Feet" "Grannies" "Footjob" "Tease" "Submissive" 
    "Blackmail" "Fur" "Chimera" "Dom/sub" "Glasses" "Big Ass" "Anime" "Furry" "Puppy Play" 
    "Masturbation" "Fucked in the ass" "Petplay" "Tickling" "Handjob" "Nude" "Swimsuit" "Pussy")
    
    # Exibe cada tag com um índice
    for i in "${!tags[@]}"; do
        echo "$((i+1))) ${tags[i]}"
    done

    echo -e "\e[34mSelect a tag number from the list, type a tag name, or enter any text to search directly: \e[0m"
    read user_input

    # Verifica se o input é um número válido e, se for, usa a tag correspondente
    if [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -ge 1 ] && [ "$user_input" -le "${#tags[@]}" ]; then
        selected_tag="${tags[user_input-1]}"
        echo -e "\e[32mSearching for tag: $selected_tag\e[0m"
        termux-open-url "https://nhentai.net/search/?q=$selected_tag"
    else
        # Caso contrário, faz uma busca direta com o input fornecido
        echo -e "\e[32mSearching for: $user_input\e[0m"
        termux-open-url "https://nhentai.net/search/?q=$user_input"
    fi
    ;;
        6)
            echo -e "\e[36mUpdating the script from GitHub...\e[0m"
            git pull origin main
sleep 1
            bash "$0"
            ;;
        7)
            echo -e "\e[36mINFO OPTIONS\e[0m"
            echo -e "\e[32m1) RANDOM: Opens a random page on Nhentai.\e[0m"
            echo -e "\e[32m2) SPECIFIC: You input a page number to go directly to it.\e[0m"
            echo -e "\e[32m3) LATEST: Takes you to the latest uploaded content.\e[0m"
            echo -e "\e[32m4) POPULAR: Directs you to the popular section of Nhentai.\e[0m"
            echo -e "\e[32m5) SEARCH: Search content by a specific tag or keyword.\e[0m"
            echo -e "\e[32m6) Updates the script from GitHub.\e[0m"
            echo -e "\e[32m7) INFO OPTIONS: Displays this help page.\e[0m"
            echo -e "\e[32m8) RANDOM TAG: Gives a random tag and searches for it.\e[0m"
            echo -e "\e[32m9) EXIT: Closes the script.\e[0m"
sleep 7
            ;;
        8)
            random_tag=${tags[$RANDOM % ${#tags[@]}]}
            echo -e "\e[32mSearching for random tag: $random_tag\e[0m"
            termux-open-url "https://nhentai.net/search/?q=$random_tag"
            ;;
        9)
            echo -e "\e[31mExiting... Bye!\e[0m"
            exit 0
            ;;
            10) 
    # Get the URL of the latest page
    latest_page_url=$(curl -s https://nhentai.net/recent/ | grep -oP 'href="\/g\/\d+' | head -n 1 | sed 's/href="//')

    # Fetch the number of pages for that specific Hentai
    max_pages=$(curl -s https://nhentai.net${latest_page_url} | grep -oP 'Page \d+ of \K\d+' | head -n 1)

    # If no pages found, default to 1
    if [ -z "$max_pages" ]; then
        max_pages=1
    fi

    # Generate a random page number between 1 and the maximum available
    random_page=$((RANDOM % max_pages + 1))

    # Redirect to a random page
    echo "Redirecting to: https://nhentai.net${latest_page_url}/${random_page}/"
    ;;
    
            
    esac

    # Espera antes de limpar e reiniciar o loop
    sleep 1
done
