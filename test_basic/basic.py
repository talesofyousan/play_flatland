import numpy as np
import time
from flatland.envs.rail_generators import complex_rail_generator
from flatland.envs.schedule_generators import complex_schedule_generator
from flatland.envs.rail_env import RailEnv

NUMBER_OF_AGENTS = 10
env = RailEnv(
            width=20,
            height=20,
            rail_generator=complex_rail_generator(
                                    nr_start_goal=10,
                                    nr_extra=1,
                                    min_dist=8,
                                    max_dist=99999,
                                    seed=0),
            schedule_generator=complex_schedule_generator(),
            number_of_agents=NUMBER_OF_AGENTS)


def my_controller():
    """
    You are supposed to write this controller
    """
    _action = {}
    for _idx in range(NUMBER_OF_AGENTS):
        _action[_idx] = np.random.randint(0, 5)
    return _action

for step in range(100):

    _action = my_controller()
    obs, all_rewards, done, _ = env.step(_action)
    print("Rewards: {}, [done={}]".format( all_rewards, done))
    time.sleep(0.3)
