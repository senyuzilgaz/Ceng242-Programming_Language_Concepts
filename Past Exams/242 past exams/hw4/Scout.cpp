#include"Scout.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Scout::Scout(unsigned int id, int x, int y, Team team) : Player(id, x, y, team)
{
    this->HP = 125;
}

int Scout::getAttackDamage() const
{
    return 25;
}

int Scout::getHealPower() const
{
    return 0;
}

int Scout::getMaxHP() const
{
    return 125;
}

std::vector<Goal> Scout::getGoalPriorityList()
{
    return {CHEST,TO_ALLY,ATTACK};
}

const std::string Scout::getClassAbbreviation() const
{
    if (getTeam() == BARBARIANS)
        return "SC";
    else
        return "sc";
}

std::vector<Coordinate> Scout::getAttackableCoordinates()
{
    return {coordinate,
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1)
    };

}

std::vector<Coordinate> Scout::getMoveableCoordinates()
{
    return {coordinate,
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1)
    };
}

std::vector<Coordinate> Scout::getHealableCoordinates()
{
    return {};
}
