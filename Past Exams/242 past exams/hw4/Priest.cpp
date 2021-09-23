#include"Priest.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Priest::Priest(unsigned int id, int x, int y, Team team) : Player(id, x, y, team)
{
    this->HP = 150;
}

int Priest::getAttackDamage() const
{
    return 0;
}

int Priest::getHealPower() const
{
    return 50;
}

int Priest::getMaxHP() const
{
    return 150;
}

std::vector<Goal> Priest::getGoalPriorityList()
{
    return {HEAL,TO_ALLY,CHEST};
}

const std::string Priest::getClassAbbreviation() const
{
    if (getTeam() == BARBARIANS)
        return "PR";
    else
        return "pr";
}

std::vector<Coordinate> Priest::getAttackableCoordinates()
{
    return {};

}

std::vector<Coordinate> Priest::getMoveableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(1,1),coordinate+Coordinate(-1,-1),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1),
    coordinate+Coordinate(1,-1),coordinate+Coordinate(-1,1)
    };
}

std::vector<Coordinate> Priest::getHealableCoordinates()
{
    return {
    coordinate+Coordinate(1,0),coordinate+Coordinate(-1,0),
    coordinate+Coordinate(1,1),coordinate+Coordinate(-1,-1),
    coordinate+Coordinate(0,1),coordinate+Coordinate(0,-1),
    coordinate+Coordinate(1,-1),coordinate+Coordinate(-1,1)
    };
}
