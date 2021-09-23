#include <iostream>
#include "apartment.h"
#include "owner.h"

using namespace std;

Apartment::Apartment(const string &property_name, int area, Owner *owner, int floor, bool having_elevator)
{
    this->property_name=property_name;
    this->area=area;
    this->floor= floor;
    this->owner=owner;
    this->having_elevator=having_elevator;
    if(owner)
        (this->owner)->add_property(this);
    
}

float Apartment::valuate()
{
    float last= area*10.0 * floor/10.0;
    if(having_elevator)
        return last*(3.0/2.0);
    else
        return last;
}