-- Enable RLS on all tables (some may already be enabled)
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.company_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.counters ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.loyalty_points ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coupons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.product_discounts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.invoices ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.bill_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hsn_codes ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any (to avoid conflicts)
DROP POLICY IF EXISTS "Users can view own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON public.profiles;

DROP POLICY IF EXISTS "Users can view own company profile" ON public.company_profiles;
DROP POLICY IF EXISTS "Users can update own company profile" ON public.company_profiles;
DROP POLICY IF EXISTS "Users can insert own company profile" ON public.company_profiles;

DROP POLICY IF EXISTS "Users can view all categories" ON public.categories;
DROP POLICY IF EXISTS "Users can insert categories" ON public.categories;
DROP POLICY IF EXISTS "Users can update own categories" ON public.categories;
DROP POLICY IF EXISTS "Users can delete own categories" ON public.categories;

DROP POLICY IF EXISTS "Users can view all counters" ON public.counters;
DROP POLICY IF EXISTS "Users can insert counters" ON public.counters;
DROP POLICY IF EXISTS "Users can update own counters" ON public.counters;
DROP POLICY IF EXISTS "Users can delete own counters" ON public.counters;

DROP POLICY IF EXISTS "Users can view all products" ON public.products;
DROP POLICY IF EXISTS "Users can insert products" ON public.products;
DROP POLICY IF EXISTS "Users can update all products" ON public.products;
DROP POLICY IF EXISTS "Users can delete own products" ON public.products;

DROP POLICY IF EXISTS "Users can view all customers" ON public.customers;
DROP POLICY IF EXISTS "Users can insert customers" ON public.customers;
DROP POLICY IF EXISTS "Users can update all customers" ON public.customers;
DROP POLICY IF EXISTS "Users can delete own customers" ON public.customers;

DROP POLICY IF EXISTS "Users can view all loyalty points" ON public.loyalty_points;
DROP POLICY IF EXISTS "Users can insert loyalty points" ON public.loyalty_points;
DROP POLICY IF EXISTS "Users can update loyalty points" ON public.loyalty_points;

DROP POLICY IF EXISTS "Users can view all coupons" ON public.coupons;
DROP POLICY IF EXISTS "Users can insert coupons" ON public.coupons;
DROP POLICY IF EXISTS "Users can update own coupons" ON public.coupons;
DROP POLICY IF EXISTS "Users can delete own coupons" ON public.coupons;

DROP POLICY IF EXISTS "Users can view all product discounts" ON public.product_discounts;
DROP POLICY IF EXISTS "Users can insert product discounts" ON public.product_discounts;
DROP POLICY IF EXISTS "Users can update own product discounts" ON public.product_discounts;
DROP POLICY IF EXISTS "Users can delete own product discounts" ON public.product_discounts;

DROP POLICY IF EXISTS "Users can view all invoices" ON public.invoices;
DROP POLICY IF EXISTS "Users can insert invoices" ON public.invoices;
DROP POLICY IF EXISTS "Users can update own invoices" ON public.invoices;

-- ============================================
-- PROFILES TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view own profile"
    ON public.profiles FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can update own profile"
    ON public.profiles FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own profile"
    ON public.profiles FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- ============================================
-- COMPANY PROFILES TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view own company profile"
    ON public.company_profiles FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can update own company profile"
    ON public.company_profiles FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own company profile"
    ON public.company_profiles FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- ============================================
-- CATEGORIES TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all categories"
    ON public.categories FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert categories"
    ON public.categories FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all categories"
    ON public.categories FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all categories"
    ON public.categories FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- COUNTERS TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all counters"
    ON public.counters FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert counters"
    ON public.counters FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all counters"
    ON public.counters FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all counters"
    ON public.counters FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- PRODUCTS TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all products"
    ON public.products FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert products"
    ON public.products FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all products"
    ON public.products FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all products"
    ON public.products FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- CUSTOMERS TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all customers"
    ON public.customers FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert customers"
    ON public.customers FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all customers"
    ON public.customers FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all customers"
    ON public.customers FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- LOYALTY POINTS TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all loyalty points"
    ON public.loyalty_points FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert loyalty points"
    ON public.loyalty_points FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all loyalty points"
    ON public.loyalty_points FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all loyalty points"
    ON public.loyalty_points FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- COUPONS TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all coupons"
    ON public.coupons FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert coupons"
    ON public.coupons FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all coupons"
    ON public.coupons FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all coupons"
    ON public.coupons FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- PRODUCT DISCOUNTS TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all product discounts"
    ON public.product_discounts FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert product discounts"
    ON public.product_discounts FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all product discounts"
    ON public.product_discounts FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all product discounts"
    ON public.product_discounts FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- INVOICES TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all invoices"
    ON public.invoices FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert invoices"
    ON public.invoices FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all invoices"
    ON public.invoices FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all invoices"
    ON public.invoices FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- BILL TEMPLATES TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all bill templates"
    ON public.bill_templates FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert bill templates"
    ON public.bill_templates FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all bill templates"
    ON public.bill_templates FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all bill templates"
    ON public.bill_templates FOR DELETE
    USING (auth.uid() IS NOT NULL);

-- ============================================
-- HSN CODES TABLE POLICIES
-- ============================================
CREATE POLICY "Users can view all hsn codes"
    ON public.hsn_codes FOR SELECT
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert hsn codes"
    ON public.hsn_codes FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all hsn codes"
    ON public.hsn_codes FOR UPDATE
    USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all hsn codes"
    ON public.hsn_codes FOR DELETE
    USING (auth.uid() IS NOT NULL);