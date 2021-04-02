-- Initialize Random 
math.randomseed(os.time())
math.random(); math.random(); math.random() -- Warming Up

-- Global Variables 
playerChoice = ''
computerChoice = ''
winningChoices = {r='Scissors', p='Rock', s='Paper'} -- Value is the option that its beats
options = {'Rock', 'Paper', 'Scissors'} 

function evaludateWinner()
    if winningChoices[playerChoice] == computerChoice then
        print('The computer chose ' .. computerChoice .. ' You Win!')
    elseif playerChoice == computerChoice then
        print("It's a draw!")
    else
        print('The computer chose ' .. computerChoice .. ' You loose!')
    end
end

function sleep(ms)
  local t = os.clock() * 1000
  while os.clock() * 1000 - t <= ms do end
end

function validatePlayerInput(input)
    for i, v in pairs(winningChoices) do
        if i == input then return true end    
    end
    return false
end

function main ()
    --Get Player and Computer Inputs
    playerChoice = string.lower(io.read('*l'))
    while validatePlayerInput(playerChoice) == false do
        print('Invalid input, please enter rock, paper or scissors:')
        playerChoice = string.lower(io.read('*l'))
    end
    computerChoice = options[math.random(1,3)]

    --Decide Winner
    print('Rock... Paper... Scissors...')
    sleep(2000)
    evaludateWinner()
    sleep(2000)

    --Play Again or Exit
    print("Enter a new choice to play again or type 'exit' to leave:")
    if string.lower(io.read('*l')) == 'exit' then
        os.exit()
    else main()
    end
end

--Main
print('Welcome to RPS in Lua :)')
print('Enter r, p or s to begin:')
main()