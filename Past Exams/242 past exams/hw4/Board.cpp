#include "Board.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/

Board::Board(unsigned int _size, std::vector<Player *> *_players, Coordinate chest):
size(_size),players(_players),chest(chest)
{

}
Board::~Board()
{
}

bool Board::isCoordinateInBoard(const Coordinate &c)
{
    return (c.x >= 0 && c.x < size && c.y >= 0 && c.y < size);
}

bool Board::isPlayerOnCoordinate(const Coordinate &c)
{
    bool result = false;
    for (int i = 0; i < players->size(); ++i)
    {
        if (players->at(i)->getCoord() == c)
        {
            result = true;
            break;
        }
        else
            continue;
    }
    return result;
}

Player *Board::operator[](const Coordinate &c)
{
    Player *result = nullptr;
    for (int i = 0; i < players->size(); ++i)
    {
        if (players->at(i)->getCoord() == c)
        {
            result = players->at(i);
            break;
        }
        else
            continue;
    }
    return result;
}

Coordinate Board::getChestCoordinates()
{
    return chest;
}

void Board::printBoardwithID()
{
    for (int j = 0; j < size; j++)
    {
        for (int i = 0; i < size; i++)
        {
            if (isPlayerOnCoordinate(Coordinate(i, j)))
                std::cout << (*this)[Coordinate(i, j)]->getBoardID() << ' ';
            else if (Coordinate(i, j) == this->getChestCoordinates())
                std::cout << "Ch" << ' ';
            else
                std::cout << "__" << ' ';
        }
        std::cout << std::endl;
    }
}

void Board::printBoardwithClass()
{
    for (int j = 0; j < size; j++)
    {
        for (int i = 0; i < size; i++)
        {
            if (isPlayerOnCoordinate(Coordinate(i, j)))
                std::cout << (*this)[Coordinate(i, j)]->getClassAbbreviation() << ' ';
            else if (Coordinate(i, j) == this->getChestCoordinates())
                std::cout << "Ch" << ' ';
            else
                std::cout << "__" << ' ';
        }
        std::cout << std::endl;
    }
}