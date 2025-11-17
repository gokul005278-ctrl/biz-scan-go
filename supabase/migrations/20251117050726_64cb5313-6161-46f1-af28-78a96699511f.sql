-- Fix multi-tenant RLS policies - all tables must filter by created_by

-- Categories table
DROP POLICY IF EXISTS "Users can view all categories" ON categories;
DROP POLICY IF EXISTS "Users can insert categories" ON categories;
DROP POLICY IF EXISTS "Users can update all categories" ON categories;
DROP POLICY IF EXISTS "Users can delete all categories" ON categories;

CREATE POLICY "Users can view own categories" ON categories
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own categories" ON categories
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own categories" ON categories
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own categories" ON categories
  FOR DELETE USING (created_by = auth.uid());

-- Counters table
DROP POLICY IF EXISTS "Users can view all counters" ON counters;
DROP POLICY IF EXISTS "Users can insert counters" ON counters;
DROP POLICY IF EXISTS "Users can update all counters" ON counters;
DROP POLICY IF EXISTS "Users can delete all counters" ON counters;

CREATE POLICY "Users can view own counters" ON counters
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own counters" ON counters
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own counters" ON counters
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own counters" ON counters
  FOR DELETE USING (created_by = auth.uid());

-- Customers table
DROP POLICY IF EXISTS "Users can view all customers" ON customers;
DROP POLICY IF EXISTS "Users can insert customers" ON customers;
DROP POLICY IF EXISTS "Users can update all customers" ON customers;
DROP POLICY IF EXISTS "Users can delete all customers" ON customers;

CREATE POLICY "Users can view own customers" ON customers
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own customers" ON customers
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own customers" ON customers
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own customers" ON customers
  FOR DELETE USING (created_by = auth.uid());

-- Coupons table
DROP POLICY IF EXISTS "Users can view all coupons" ON coupons;
DROP POLICY IF EXISTS "Users can insert coupons" ON coupons;
DROP POLICY IF EXISTS "Users can update all coupons" ON coupons;
DROP POLICY IF EXISTS "Users can delete all coupons" ON coupons;

CREATE POLICY "Users can view own coupons" ON coupons
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own coupons" ON coupons
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own coupons" ON coupons
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own coupons" ON coupons
  FOR DELETE USING (created_by = auth.uid());

-- Products table
DROP POLICY IF EXISTS "Users can view all products" ON products;
DROP POLICY IF EXISTS "Users can insert products" ON products;
DROP POLICY IF EXISTS "Users can update all products" ON products;
DROP POLICY IF EXISTS "Users can delete all products" ON products;

CREATE POLICY "Users can view own products" ON products
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own products" ON products
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own products" ON products
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own products" ON products
  FOR DELETE USING (created_by = auth.uid());

-- Product discounts table
DROP POLICY IF EXISTS "Users can view all product discounts" ON product_discounts;
DROP POLICY IF EXISTS "Users can insert product discounts" ON product_discounts;
DROP POLICY IF EXISTS "Users can update all product discounts" ON product_discounts;
DROP POLICY IF EXISTS "Users can delete all product discounts" ON product_discounts;

CREATE POLICY "Users can view own product discounts" ON product_discounts
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own product discounts" ON product_discounts
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own product discounts" ON product_discounts
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own product discounts" ON product_discounts
  FOR DELETE USING (created_by = auth.uid());

-- Invoices table
DROP POLICY IF EXISTS "Users can view all invoices" ON invoices;
DROP POLICY IF EXISTS "Users can insert invoices" ON invoices;
DROP POLICY IF EXISTS "Users can update all invoices" ON invoices;
DROP POLICY IF EXISTS "Users can delete all invoices" ON invoices;

CREATE POLICY "Users can view own invoices" ON invoices
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own invoices" ON invoices
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own invoices" ON invoices
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own invoices" ON invoices
  FOR DELETE USING (created_by = auth.uid());

-- Loyalty points table
DROP POLICY IF EXISTS "Users can view all loyalty points" ON loyalty_points;
DROP POLICY IF EXISTS "Users can insert loyalty points" ON loyalty_points;
DROP POLICY IF EXISTS "Users can update all loyalty points" ON loyalty_points;
DROP POLICY IF EXISTS "Users can delete all loyalty points" ON loyalty_points;

CREATE POLICY "Users can view own loyalty points" ON loyalty_points
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own loyalty points" ON loyalty_points
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own loyalty points" ON loyalty_points
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own loyalty points" ON loyalty_points
  FOR DELETE USING (created_by = auth.uid());

-- HSN codes table (keep shared access for reference data)
DROP POLICY IF EXISTS "Users can view all hsn codes" ON hsn_codes;
DROP POLICY IF EXISTS "Users can insert hsn codes" ON hsn_codes;
DROP POLICY IF EXISTS "Users can update all hsn codes" ON hsn_codes;
DROP POLICY IF EXISTS "Users can delete all hsn codes" ON hsn_codes;

CREATE POLICY "Users can view all hsn codes" ON hsn_codes
  FOR SELECT USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can insert hsn codes" ON hsn_codes
  FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Users can update all hsn codes" ON hsn_codes
  FOR UPDATE USING (auth.uid() IS NOT NULL);

CREATE POLICY "Users can delete all hsn codes" ON hsn_codes
  FOR DELETE USING (auth.uid() IS NOT NULL);

-- Bill templates table
DROP POLICY IF EXISTS "Users can view all bill templates" ON bill_templates;
DROP POLICY IF EXISTS "Users can insert bill templates" ON bill_templates;
DROP POLICY IF EXISTS "Users can update all bill templates" ON bill_templates;
DROP POLICY IF EXISTS "Users can delete all bill templates" ON bill_templates;

CREATE POLICY "Users can view own bill templates" ON bill_templates
  FOR SELECT USING (created_by = auth.uid());

CREATE POLICY "Users can insert own bill templates" ON bill_templates
  FOR INSERT WITH CHECK (created_by = auth.uid());

CREATE POLICY "Users can update own bill templates" ON bill_templates
  FOR UPDATE USING (created_by = auth.uid());

CREATE POLICY "Users can delete own bill templates" ON bill_templates
  FOR DELETE USING (created_by = auth.uid());