pageextension 60000 "Item Card Ext" extends "Item Card"
{
    layout
    {
        modify("Purchasing Blocked")
        {
            Caption = 'DNR';
        }
        modify("Auto. Block on Stock-out")
        {
            Caption = 'DISCONTINUED';
        }


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}