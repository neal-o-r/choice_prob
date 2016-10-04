
function pick_door(doors::Array)

        return doors[rand(1:length(doors))]        
end

function Monty_Hall(strategy)

        doors = [1, 2, 3]

        its_behind = rand(1:3)

        you_pick = rand(1:3)
        
        host_options = doors[(doors .!= you_pick) & (doors .!= its_behind)]
        host_picks = pick_door(host_options)

        splice!(doors, host_picks)
        
        if strategy == "switch"
                final_answer = doors[doors .!= you_pick][1]
        end
        
        if strategy == "stick"
                final_answer = you_pick
        end

        if final_answer == its_behind
                return 1
        else
                return 0
        end
end

stick = Array(Int, 1000)
for i = 1:1000
        stick[i] = Monty_Hall("stick")        
end

switch = Array(Int, 1000)
for i = 1:1000
        switch[i] = Monty_Hall("switch")
end

switch_pc = round(100*(sum(switch) / 1000.), 2)
stick_pc  = round(100*(sum(stick) /  1000.), 2)
println("Switching wins of $switch_pc% games")
println("Sticking wins of $stick_pc% games")





