#include"Fighter.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Fighter::Fighter(unsigned int id, int x, int y, Team team) : Player(id, x, y, team)
{
    this->HP = 400;
}

int Fighter::getAttackDamage() const
{
    return 100;
}

int Fighter::getHealPower() const
{
    return 0;
}

int Fighter::getMaxHP() const
{
    return 400;
}

std::vector<Goal> Fighter::getGoalPriorityList()
{
    return {ATTACK,TO_ENEMY,CHEST};
}

const std::string Fighter::getClassAbbreviation() const
{
    if (getTeam() == BARBARIANS)
        return "FI";
    else
        return "fi";
}

std::vector<Coordinate> Fighter::getAttackableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1),
    };

}

std::vector<Coordinate> Fighter::getMoveableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1)
    };
}

std::vector<Coordinate> Fighter::getHealableCoordinates()
{
    return {};
}