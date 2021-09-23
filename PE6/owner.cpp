#include <iostream>
#include <string>
#include <vector>
#include "owner.h"

using namespace std;

Owner::Owner()
{
}

Owner::Owner(const string &name, float balance)
{
    this->name = name;
    this->balance = balance;
}

void Owner::print_info()
{
    
}

string &Owner::get_name()
{
    return this->name;
}

void Owner::add_property(Property *property)
{
    properties.push_back(property);
}
 /**
     * Buy operation.
     * 
     * 1- Check balance
     * 2- Check whether the seller owns given property or not.
     * 3- Apply transaction if both OK.
     * 
     * @param property Pointer of the property
     * @param seller Pointer of the seller
    */
void Owner::buy(Property *property, Owner *seller)
{
    float bal= property->valuate();
    bool flag=false;
    int counter=0;
    for(std::vector<Property*>::const_iterator it = (seller->properties).begin(); it!=  (seller->properties).end(); ++it,++counter)
        if((*it) == property){
            flag=1;
            break;
        }
    cout<<"[BUY] Property: "<<property->get_name()<<" Value: "<<bal<<"$ "<<seller->get_name()<<"--->"<<this->get_name()<<endl;
        if((this->balance)>=bal){
            if(!flag)
                cout<<"[ERROR] Transaction  on  unowned  property"<<endl;
            else{
                this->add_property(property);
                property->set_owner(this);
                this->balance = this->balance-bal;
                seller->balance =seller->balance+bal;
                (seller->properties).erase( (seller->properties).begin()+counter);
                
            }
        }
         else
            cout<<"[ERROR] Unaffordable  property"<<endl;
            
            
        
}

void Owner::sell(Property *property, Owner *owner)
{
    float bal= property->valuate();
    bool flag=false;
    int counter=0;
    for(std::vector<Property*>::const_iterator it = properties.begin(); it!=  properties.end(); ++it,++counter)
        if((*it) == property){
            flag=1;
            break;
        }  
    cout<<"[SELL] Property: "<<property->get_name()<<" Value: "<<bal<<"$ "<<this->get_name()<<"--->"<<owner->get_name()<<endl;
        if((owner->balance)>=bal){
            if(!flag)
                cout<<"[ERROR] Transaction  on  unowned  property"<<endl;
            else{
                owner->add_property(property);
                property->set_owner(owner);
                this->balance += bal;
                owner->balance -= bal;
                properties.erase(properties.begin()+counter);

            }
        }
        else
            cout<<"[ERROR] Unaffordable  property"<<endl;
            
     
    
}
/**
     * List wealth of the owner:
     * 
     * Properties of <name>
     * Balance: <balance>$
     * 1. <name of the property-1>
     * 2. <name of the property-2>
     * ....
     * n. <name of the property-n>
    */
void Owner::list_properties()
{
    int c=1;
    cout<<"Properties of "<<this->name<<":"<<endl;
    cout<<"Balance: "<<this->balance<<"$"<<endl;
    for(std::vector<Property*>::const_iterator it = properties.begin(); it!= properties.end(); ++it)
        cout<<c++<<". "<<(*it)->get_name()<<endl;

}