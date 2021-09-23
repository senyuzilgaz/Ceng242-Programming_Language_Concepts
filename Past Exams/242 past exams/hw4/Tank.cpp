#include"Tank.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Tank::Tank(unsigned int id, int x, int y, Team team) : Player(id, x, y, team)
{
    this->HP = 1000;
}

int Tank::getAttackDamage() const
{
    return 25;
}

int Tank::getHealPower() const
{
    return 0;
}

int Tank::getMaxHP() const
{
    return 1000;
}

std::vector<Goal> Tank::getGoalPriorityList()
{
    return {TO_ENEMY,ATTACK,CHEST};
}

const std::string Tank::getClassAbbreviation() const
{
    if (getTeam() == BARBARIANS)
        return "TA";
    else
        return "ta";
}

std::vector<Coordinate> Tank::getAttackableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1)
    };

}

std::vector<Coordinate> Tank::getMoveableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1)
    };
}

std::vector<Coordinate> Tank::getHealableCoordinates()
{
    return {};
}
