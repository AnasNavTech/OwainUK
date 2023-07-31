pageextension 60001 "Purchase Order Subfrom Ext" extends "Purchase Order Subform"
{
    layout
    {
        modify("Promised Receipt Date")
        {
            Caption = 'Cargo Ready Date';
        }



    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}