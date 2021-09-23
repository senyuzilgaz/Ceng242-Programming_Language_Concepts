#include "Archer.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Archer::Archer(unsigned int id, int x, int y, Team team) : Player(id, x, y, team)
{
    this->HP = 200;
}

int Archer::getAttackDamage() const
{
    return 50;
}

int Archer::getHealPower() const
{
    return 0;
}

int Archer::getMaxHP() const
{
    return 200;
}

std::vector<Goal> Archer::getGoalPriorityList()
{
    return {ATTACK};
}

const std::string Archer::getClassAbbreviation() const
{
    if (getTeam() == BARBARIANS)
        return "AR";
    else
        return "ar";
}

std::vector<Coordinate> Archer::getAttackableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(2,0),coordinate+Coordinate(-2,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1),
    coordinate+Coordinate(0,2),coordinate+Coordinate(0,-2),
    };

}

std::vector<Coordinate> Archer::getMoveableCoordinates()
{
    return {};
}

std::vector<Coordinate> Archer::getHealableCoordinates()
{
    return {};
}
