#include <iostream>
#include "office.h"
#include "owner.h"

using namespace std;

Office::Office(const string &property_name, int area, Owner *owner, bool having_wifi, bool having_reception)
{
    this->property_name=property_name;
    this->area=area;
    this->owner=owner;
    this-> having_wifi= having_wifi;
    this-> having_reception= having_reception;
    if(owner)
        (this->owner)->add_property(this);
    
}

float Office::valuate()
{
    float last= (area *5);
    if(having_wifi)
        if(having_reception)
            return ((3.0/2.0)*last*(1.3));
        else
            return last*(1.3);
    else
        if(having_reception)
            return last*(1.5);
        else
            return last;
}