@IsTest
public with sharing class CreateProductListControllerTest {

    private static String INVALID_PRODUCT = 'The expected product is not null.';
    private static String INVALID_AMOUNT = 'The expected value is not 0.';
    private static String INVALID_PRICEBOOK = 'The expected pricebook is not null.';

    @IsTest
    static void createProductTest() {
        OpportunityLineItem product = CreateProductListController.createProduct();
        System.assertNotEquals(null, product, INVALID_PRODUCT);

        List<OpportunityLineItem> products = [SELECT Id FROM OpportunityLineItem];
        System.assertEquals(0, products.size(), INVALID_AMOUNT);
    }

    @IsTest
    static void createListProductsTest() {
        List<OpportunityLineItem> products = CreateProductListController.createListProducts();
        System.assertEquals(0, products.size(), INVALID_AMOUNT);        
    }

    @IsTest
    static void getPricebookEntryTest() {
        try{
            PricebookEntry pricebook = CreateProductListController.getPricebookEntry();
        }
        catch(Exception er){
            System.assertEquals('System.QueryException', er.getTypeName(),
            'Expected exception with type System.QueryException, but got ' + er.getTypeName());
        }
    }
}