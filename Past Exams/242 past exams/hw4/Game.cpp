#include "Game.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE
*/
Game::Game(unsigned int maxTurnNumber, unsigned int boardSize, Coordinate chest) : board(Board(boardSize, &players, chest)), maxTurnNumber(maxTurnNumber)
{
	turnNumber = 1;
}

Game::~Game()
{
	for (int i = 0; i < players.size(); ++i)
	{
		delete players[i];
	}
}

void Game::addPlayer(int id, int x, int y, Team team, std::string cls)
{
	if (cls == "Archer")
	{
		Player *archer = new Archer(id, x, y, team);
		players.push_back(archer);
	}
	else if (cls == "Fighter")
	{
		Player *fighter = new Fighter(id, x, y, team);
		players.push_back(fighter);
	}
	else if (cls == "Priest")
	{
		Player *priest = new Priest(id, x, y, team);
		players.push_back(priest);
	}
	else if (cls == "Scout")
	{
		Player *scout = new Scout(id, x, y, team);
		players.push_back(scout);
	}
	else //Tank
	{
		Player *tank = new Tank(id, x, y, team);
		players.push_back(tank);
	}
}

bool Game::isGameEnded()
{
}

void Game::playTurn()
{
}

Goal Game::playTurnForPlayer(Player *player)
{
}
