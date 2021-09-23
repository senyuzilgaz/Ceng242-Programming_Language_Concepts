#include "Player.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Player::Player(unsigned int id, int x, int y, Team team):
id(id), coordinate(Coordinate(x, y)), team(team)
{
}

unsigned int Player::getID() const
{
    return id;
}

const Coordinate &Player::getCoord() const
{
    return coordinate;
}

int Player::getHP() const
{
    return HP;
}

Team Player::getTeam() const
{
    return team;
}

std::string Player::getBoardID()
{
    if (id < 10)
    {
        std::string str = '0' + std::to_string(id);
        return str;
    }
    else
    {
        std::string str = std::to_string(id);
        return str;
    }
}

bool Player::attack(Player *enemy)
{
    std::string attackstr;
    attackstr = "Player " + getBoardID() + " attacked Player " + 
    enemy->getBoardID() + " (" + std::to_string(getAttackDamage()) + ')';
    std::cout << attackstr << std::endl;
    enemy->HP = enemy->getHP() - getAttackDamage();
    return enemy->isDead();
}

void Player::heal(Player *ally)
{
    std::string healstr;
    healstr = "Player " + getBoardID() + " healed Player " + 
    ally->getBoardID() + " (" + std::to_string(getAttackDamage()) + ')';
    ally->HP = ally->getHP() + getHealPower();
    if(ally->HP > ally->getMaxHP()) ally->HP = ally->getMaxHP();
    std::cout << healstr << std::endl;
}

void Player::movePlayerToCoordinate(Coordinate c)
{
    std::cout << "Player " << getBoardID() << " moved from " << coordinate << " to " << c << std::endl;
    coordinate = c;
}

bool Player::isDead() const
{
    return getHP() <= 0;
}