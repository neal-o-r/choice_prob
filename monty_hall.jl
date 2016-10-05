using Gadfly
using Cairo
using Compose


function pick_door(doors::Array)

        return doors[rand(1:length(doors))]        
end

function Monty_Hall(strategy)

        doors = [1, 2, 3] #there are three doors

        its_behind = rand(1:3) # the car is behind

        you_pick = rand(1:3) # your choice is
        
        #= the host picks one of the doors that you didn't choose,
           but obviously not the one with the car behind it=#

        host_options = doors[(doors .!= you_pick) & (doors .!= its_behind)]
        host_picks = pick_door(host_options)
        splice!(doors, host_picks) # remove that door
        
        if strategy == "switch"
                # if the strategy is switch then switch
                final_answer = doors[doors .!= you_pick][1]
        end
        
        if strategy == "stick"
                # otherwise don't
                final_answer = you_pick
        end

        if final_answer == its_behind
                return 1 # you won!
        else
                return 0 # you didn't :(
        end
end

function play_monty_hall()

        stick = zeros(Int, 1000)
        stick_cum_pro = zeros(Float64, 1000)
        for i = 1:1000

                stick[i] = Monty_Hall("stick")
                 
                stick_cum_pro[i] = sum(stick) / i       

        end

        switch = zeros(Int, 1000)
        switch_cum_pro = zeros(Float64, 1000)
        for i = 1:1000

                switch[i] = Monty_Hall("switch")

                switch_cum_pro[i] = sum(switch) / i
       
        end

        fig = plot(
                layer(x=1:1000, y=stick_cum_pro, Geom.line),
                layer(x=1:1000, y=switch_cum_pro, Geom.line)
        )

        draw(PDF("monty_hall.pdf", 6inch, 4inch), fig)
        
        switch_pc = round(100*(sum(switch) / 1000.), 2)
        stick_pc  = round(100*(sum(stick) /  1000.), 2)
        println("Switching wins of $switch_pc% games")
        println("Sticking wins of $stick_pc% games")

end



