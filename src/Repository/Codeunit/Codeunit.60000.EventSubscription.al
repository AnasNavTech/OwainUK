codeunit 60000 EventSubscripton
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeCopyFromItem', '', true, true)]
    local procedure "PurchaseLine_OnBeforeCopyFromItem"
    (
        var PurchaseLine: Record "Purchase Line";
        var Item: Record "Item"
    )
    begin
        if PurchaseLine.IsCreditDocType() then begin
            Item.Blocked := false;
        end;

    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeCopyFromItem', '', true, true)]
    local procedure "SalesLine_OnBeforeCopyFromItem"
    (
        var SalesLine: Record "Sales Line";
        Item: Record "Item";
        var IsHandled: Boolean
    )
    var

    begin

        if SalesLine.IsCreditDocType() then begin
            IsHandled := true;
        end;


    end;


    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnBeforeDisplayErrorIfItemIsBlocked', '', true, true)]
    local procedure "ItemJournalLine_OnBeforeDisplayErrorIfItemIsBlocked"
    (
        var Item: Record "Item";
        var ItemJournalLine: Record "Item Journal Line";
        var IsHandled: Boolean
    )
    begin
        IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeGetItem', '', true, true)]
    local procedure "ItemJnl.-PostLine_OnBeforeGetItem"
    (
        var Item: Record "Item";
        ItemNo: Code[20];
        Unconditionally: Boolean;
        var HasGotItem: Boolean;
        var IsHandled: Boolean
    )
    var
        ItemRec: Record Item;
    begin
        HasGotItem := true;
        // IsHandled := true;

        ItemRec.Get(ItemNo);
        ItemRec.Validate(Blocked, false);
        ItemRec.Modify();
    end;


    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeVerifyPurchaseItemNotBlocked', '', true, true)]
    local procedure "GetSourceDocuments_OnBeforeVerifyPurchaseItemNotBlocked"
    (
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        SkipBlockedItem: Boolean;
        var IsHandled: Boolean
    )
    begin
        IsHandled := true;

    end;


    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeVerifySalesItemNotBlocked', '', true, true)]
    local procedure "GetSourceDocuments_OnBeforeVerifySalesItemNotBlocked"
    (
        SalesHeaer: Record "Sales Header";
        SalesLine: Record "Sales Line";
        var IsHandled: Boolean;
        SkipBlockedItem: Boolean
    )
    begin
        IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeValidatePromisedReceiptDate', '', true, true)]
    local procedure "Purchase Header_OnBeforeValidatePromisedReceiptDate"
    (
        var PurchaseHeader: Record "Purchase Header";
        xPurchaseHeader: Record "Purchase Header";
        var IsHandled: Boolean;
        CUrrentFieldNo: Integer
    )
    begin
        IsHandled := true;

    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidatePromisedReceiptDate', '', true, true)]
    local procedure "Purchase Line_OnBeforeValidatePromisedReceiptDate"
    (
        var PurchaseLine: Record "Purchase Line";
        CallingFieldNo: Integer;
        var IsHandled: Boolean;
        xPurchaseLine: Record "Purchase Line"
    )
    begin
        IsHandled := true;

    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnValidateExpectedReceiptDateOnBeforeCheckDateConflict', '', true, true)]
    local procedure "Purchase Line_OnValidateExpectedReceiptDateOnBeforeCheckDateConflict"
    (
        var PurchaseLine: Record "Purchase Line";
        var IsHandled: Boolean
    )
    begin
        IsHandled := true;

    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeValidateRequestedReceiptDate', '', true, true)]
    local procedure "Purchase Header_OnBeforeValidateRequestedReceiptDate"
    (
        var PurchaseHeader: Record "Purchase Header";
        xPurchaseHeader: Record "Purchase Header";
        CurrentFieldNo: Integer;
        var IsHandled: Boolean
    )
    begin

        IsHandled := true;

    end;



    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateRequestedReceiptDate', '', true, true)]
    local procedure "Purchase Line_OnBeforeValidateRequestedReceiptDate"
    (
        var PurchaseLine: Record "Purchase Line";
        xPurchaseLine: Record "Purchase Line";
        var CustomCalendarChange: array[2] of Record "Customized Calendar Change";
        CurrFieldNo: Integer;
        var IsHandled: Boolean
    )
    begin
        IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidatePlannedReceiptDateWithCustomCalendarChange', '', true, true)]
    local procedure "Purchase Line_OnBeforeValidatePlannedReceiptDateWithCustomCalendarChange"
    (
        var PurchaseLine: Record "Purchase Line";
        var xPurchaseLine: Record "Purchase Line";
        var InHandled: Boolean
    )
    begin
        InHandled := true;
    end;






}