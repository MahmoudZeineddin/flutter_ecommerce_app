# Flutter E-Commerce App - MVP Sprint Plan (2-3 Weeks)

## Sprint Goal
Transform this app from a product browser into a **functional e-commerce MVP** with cart, favorites, search, and basic user features within 2-3 weeks.

**Deadline:** 2-3 weeks from start date
**Start Date:** Mon, 22 June 2026
**Scope:** Core shopping features only - whatever is completed by deadline is the MVP

---

## Clean Code Principles - READ THIS FIRST! 🎯

Before you start coding, understand these **non-negotiable** principles. Follow them throughout the sprint:

### 1. NO MAGIC STRINGS ❌
**Bad:**
```dart
if (category == 'electronics') { ... }
Navigator.pushNamed(context, '/product-details');
final data = prefs.getString('cart_items');
```

**Good:**
```dart
// Create constants file
class AppStrings {
  static const String electronics = 'electronics';
}

class AppRoutes {
  static const String productDetails = '/product-details';
}

class StorageKeys {
  static const String cartItems = 'cart_items';
}

// Use them
if (category == AppStrings.electronics) { ... }
Navigator.pushNamed(context, AppRoutes.productDetails);
final data = prefs.getString(StorageKeys.cartItems);
```

**Where to put constants:**
- Routes → `core/routers/app_routes.dart` (already exists!)
- Strings → Create `core/constants/app_strings.dart`
- Storage keys → Create `core/constants/storage_keys.dart`

---

### 2. NO MAGIC NUMBERS ❌
**Bad:**
```dart
SizedBox(height: 20)
if (quantity > 10) showError();
await Future.delayed(Duration(milliseconds: 500));
```

**Good:**
```dart
class AppDimensions {
  static const double spacing = 20.0;
  static const int maxCartQuantity = 10;
  static const int searchDebounceMs = 500;
}

// Use them
SizedBox(height: AppDimensions.spacing)
if (quantity > AppDimensions.maxCartQuantity) showError();
await Future.delayed(Duration(milliseconds: AppDimensions.searchDebounceMs));
```

---

### 3. PROPER ERROR HANDLING ⚠️
**Bad:**
```dart
try {
  final products = await repository.getProducts();
} catch (e) {
  print(e); // Never use print!
}
```

**Good:**
```dart
try {
  emit(CartLoading());
  final products = await repository.getProducts();
  emit(CartLoaded(products));
} catch (e) {
  emit(CartError('Failed to load products. Please try again.'));
  // Log for debugging (optional)
  log('Error loading products: $e');
}
```

**Error Handling Checklist:**
- ✅ Always catch errors in async operations
- ✅ Emit error states (CartError, SearchError, etc.)
- ✅ Show user-friendly messages (not technical errors)
- ✅ Use `log()` for logging, never `print()`
- ✅ Give users a way to retry (retry button)

---

### 4. MEANINGFUL NAMING 📝

**Bad Names:**
```dart
MyOrderPage // ❌ Avoid "My" prefix
fetchData() // ❌ Too vague
temp, data, list // ❌ Meaningless
x, y, a, b // ❌ Single letters (except in loops)
```

**Good Names:**
```dart
OrdersPage or CartPage // ✅ Clear purpose
loadCartItems() // ✅ Specific action
cartItems, searchResults // ✅ Describes content
product, category, user // ✅ Domain language
```

**Naming Conventions:**
- **Files**: `cart_cubit.dart`, `product_item.dart` (snake_case)
- **Classes**: `CartCubit`, `ProductItem` (PascalCase)
- **Variables**: `cartItems`, `totalPrice` (camelCase)
- **Constants**: `AppConstants.maxQuantity` (camelCase in class)
- **Private**: `_saveCart()`, `_items` (underscore prefix)

**Function Naming:**
- Use verbs: `loadData()`, `addToCart()`, `removeItem()`
- Be specific: `saveCartToStorage()` not `save()`
- Avoid abbreviations: `removeProduct()` not `rmProd()`

---

### 5. FILE ORGANIZATION 📁
**Bad:**
```
lib/
  ├── page1.dart
  ├── page2.dart
  ├── widget1.dart
  ├── cubit1.dart
```

**Good:**
```
lib/
  ├── core/
  │   ├── constants/
  │   │   ├── app_strings.dart
  │   │   ├── storage_keys.dart
  │   │   └── app_dimensions.dart
  ├── presentation/
  │   ├── pages/
  │   │   └── cart/
  │   │       └── cart_page.dart
  │   ├── view_models/
  │   │   └── cart_cubit/
  │   │       ├── cart_cubit.dart
  │   │       └── cart_state.dart
```

**Follow existing structure** - don't create new patterns!

---

### 6. NULL SAFETY 🛡️
**Bad:**
```dart
final price = product.price!; // ❌ Dangerous!
String? name;
Text(name); // ❌ Might crash
```

**Good:**
```dart
final price = product.price ?? 0.0; // ✅ Safe default
final name = user?.name ?? 'Guest'; // ✅ Fallback
if (product.price != null) { // ✅ Check first
  Text('\$${product.price}');
}
```

**Null Safety Rules:**
- Never use `!` unless you're 100% sure value exists
- Always provide fallbacks with `??`
- Check nulls before using: `if (value != null)`
- Use `?.` for safe access: `user?.name`

---

### 7. AVOID HARDCODED DATA 🚫
**Bad:**
```dart
final categories = ['Electronics', 'Fashion', 'Home']; // ❌ In widget
final maxQuantity = 10; // ❌ In function
```

**Good:**
```dart
// In constants file
class AppConstants {
  static const List<String> categories = ['Electronics', 'Fashion', 'Home'];
  static const int maxCartQuantity = 10;
}

// Or better - get from API/config
final categories = await repository.getCategories();
```

---

### 8. CLEAN STATE MANAGEMENT 🔄
**Bad:**
```dart
class CartCubit extends Cubit<CartState> {
  List<Product> items = []; // ❌ Mutable state

  void addItem(Product p) {
    items.add(p); // ❌ Direct mutation
    emit(CartState()); // ❌ Not emitting new state
  }
}
```

**Good:**
```dart
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addItem(Product product) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = [...currentState.items, product]; // ✅ Immutable
      emit(CartLoaded(items: updatedItems)); // ✅ New state
    }
  }
}
```

**State Management Rules:**
- Never mutate state directly
- Always emit new state objects
- Use immutable data structures
- Use `copyWith()` for state updates

---

### 9. PROPER WIDGET STRUCTURE 🏗️
**Bad:**
```dart
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(...), // 50 lines of nested widgets
          Container(...), // 50 more lines
          Container(...), // 50 more lines
        ],
      ),
    );
  }
}
```

**Good:**
```dart
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _ProductHeader(),    // ✅ Extracted widgets
          _ProductImages(),    // ✅ Single responsibility
          _ProductDetails(),   // ✅ Reusable
          _PurchaseButton(),   // ✅ Readable
        ],
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget { ... }
class _ProductImages extends StatelessWidget { ... }
```

**Widget Rules:**
- If build() > 50 lines, extract widgets
- One widget = one responsibility
- Private widgets (\_) if only used in one file
- Public widgets if reused across files

---

### 10. AVOID COMMENTED CODE 🗑️
**Bad:**
```dart
// final oldPrice = product.price * 0.9;
// if (user.isPremium) {
//   applyDiscount();
// }
final price = product.price;
```

**Good:**
```dart
final price = product.price; // ✅ Clean, no clutter
```

**Commenting Rules:**
- Delete old code - git has history
- Only comment WHY, not WHAT
- Remove TODO comments before committing
- Use dartdoc (///) for public APIs only

---

### 11. CONSISTENT FORMATTING 📐
**Rules:**
- Use `dart format .` before every commit
- 2 spaces for indentation (not tabs)
- Max line length: 80 characters
- Always use trailing commas for multi-line

**Good:**
```dart
CartItem(
  product: product,
  quantity: quantity,
  totalPrice: totalPrice, // ✅ Trailing comma
)
```

---

## 🎯 Daily Clean Code Checklist

Before committing each day, ask yourself:

- [ ] No magic strings - all strings are constants?
- [ ] No magic numbers - all numbers are constants?
- [ ] All errors caught and handled gracefully?
- [ ] User-friendly error messages shown?
- [ ] Variable/function names are clear and meaningful?
- [ ] No "My" prefix in file names?
- [ ] No hardcoded data in widgets?
- [ ] State is immutable and properly emitted?
- [ ] Widgets extracted if build() > 50 lines?
- [ ] No commented-out code?
- [ ] Ran `dart format .`?
- [ ] No debug print statements?
- [ ] Null safety handled properly?

**If you answer NO to any question, fix it before committing!**

---

## Sprint Overview

### Week 1: Shopping Core (Cart + Favorites)
**Goal:** Users can add products to cart and favorites

- Story 1: Shopping Cart System
- Story 2: Favorites System
- Story 3: Bug Fixes & Polish

### Week 2: Discovery Features (Search + Filtering)
**Goal:** Users can find products easily

- Story 4: Search Functionality
- Story 5: Category Filtering & See All
- Story 6: Data Persistence

### Week 3 (Optional): User Features
**Goal:** Basic user management

- Story 7: Firebase & Authentication Setup
- Story 8: User Profile & Settings
- Story 9: Final Polish & Testing

---

# WEEK 1: SHOPPING CORE

## Story 1: Shopping Cart System
**Priority:** P0 - Must Have
**Estimate:** 5 days
**Story Points:** 8

**User Story:**
*As a user, I want to add products to my shopping cart and manage quantities so that I can purchase multiple items.*

**Acceptance Criteria:**
- [ ] User can add products to cart from any product card
- [ ] User can view cart items in My Order page
- [ ] User can increase/decrease quantity for each item
- [ ] User can remove items from cart
- [ ] Cart shows total price calculation
- [ ] Cart badge shows item count on bottom nav
- [ ] Cart persists when navigating between pages

---

### Day 1: Cart State Management
**Goal:** Build a cart state management system that can handle adding, removing, and updating products

**What You Need to Build:**
- [ ] CartCubit and CartState following the same pattern as HomeCubit
- [ ] Cart should handle: adding items, removing items, updating quantities, clearing cart
- [ ] Cart should track items and calculate total price automatically
- [ ] Create a model to represent products in the cart (with quantity info)

**Success Criteria:**
- ✅ Can add products to cart without errors
- ✅ Can calculate total price of all cart items
- ✅ Cart state updates trigger UI rebuilds
- ✅ No crashes when performing cart operations

**Think About:**
- How will you prevent adding the same product twice? Should quantity increase instead?
- How will you calculate the total? Where does this logic belong?
- What states does the cart need? (hint: look at how HomeCubit manages states)

**Reference:** Check `presentation/view_models/home_cubit/` for Cubit pattern examples

**Deliverable:** Working CartCubit with all cart operations

**Time:** 6-8 hours

---

### Day 2: Cart UI - My Order Page
**Goal:** Transform the placeholder My Order page into a fully functional cart display

**What You Need to Build:**
- [ ] Connect the My Order page to your CartCubit
- [ ] Display all cart items with product details (image, name, price)
- [ ] Add controls to change quantity for each item
- [ ] Allow users to remove items from cart
- [ ] Show total price at the bottom
- [ ] Handle empty cart state gracefully

**Success Criteria:**
- ✅ Cart items display correctly when viewing page
- ✅ Can increase/decrease quantity and see price update
- ✅ Can remove items and see them disappear
- ✅ Total price updates automatically
- ✅ Shows friendly message when cart is empty

**Think About:**
- How should the page look when cart is empty? What should the user do next?
- Should quantity buttons be disabled when reaching limits (min/max)?
- Where should the total price be positioned for best UX?

**Reference:** Look at `presentation/pages/home_page.dart` for BlocBuilder pattern

**Deliverable:** Fully functional My Order page displaying cart items

**Time:** 6-8 hours

---

### Day 3: Wire Cart to Product Cards
**Goal:** Connect the "+" buttons throughout the app to your CartCubit

**What You Need to Build:**
- [ ] Make all "+" buttons functional (they currently do nothing)
- [ ] Show user feedback when item added to cart
- [ ] Display cart item count badge on bottom navigation
- [ ] Test across all product sections

**Success Criteria:**
- ✅ Tapping "+" adds product to cart
- ✅ User sees confirmation (snackbar or toast)
- ✅ Bottom nav shows cart badge with item count
- ✅ Badge updates in real-time as cart changes
- ✅ Works from Best Sellers, Trending, and Hot Deals sections

**Think About:**
- Where should you access the CartCubit from? (hint: context)
- What feedback makes sense - snackbar, animation, or both?
- How will the badge know when cart changes? (hint: BlocBuilder)

**Reference:** Look at product_item.dart line 175 - there's a TODO comment there!

**Deliverable:** All add-to-cart buttons functional with feedback

**Time:** 4-6 hours

---

### Day 4: Register Cart in DI & Polish
**Goal:** Make CartCubit available app-wide through dependency injection and handle edge cases

**What You Need to Build:**
- [ ] Register CartCubit in dependency injection container
- [ ] Handle duplicate product additions intelligently
- [ ] Add polish: animations, loading states, user feedback
- [ ] Test and fix edge cases

**Success Criteria:**
- ✅ CartCubit properly registered (follow HomeCubit pattern in DI)
- ✅ Adding same product twice increases quantity instead of duplicating
- ✅ Cart handles edge cases without crashes (empty cart, max quantity, rapid tapping)
- ✅ Smooth user experience with appropriate feedback

**Think About:**
- What should happen when user adds same product twice?
- Should there be a maximum quantity limit? Why or why not?
- How can you prevent race conditions when user taps buttons quickly?

**Reference:** Check `injection_container.dart` to see how HomeCubit is registered

**Deliverable:** CartCubit registered in DI, all edge cases handled

**Time:** 4-6 hours

---

### Day 5: Cart Persistence
**Goal:** Make the cart survive app restarts using local storage

**What You Need to Build:**
- [ ] Add local storage capability to the app
- [ ] Create a service to handle saving/loading cart data
- [ ] Integrate persistence into CartCubit
- [ ] Handle data serialization properly

**Success Criteria:**
- ✅ Cart items saved to device storage
- ✅ Cart loads automatically when app opens
- ✅ Works correctly: add items → close app → reopen → items still there
- ✅ No data corruption or crashes

**Think About:**
- What format will you use to store cart data? (hint: JSON)
- When should you save - after every change or periodically?
- What happens if saved data is corrupted? How will you handle it?
- Do you need to save product images or just IDs?

**Reference:** Look at how ProductModel uses `fromJson()` for serialization ideas

**Deliverable:** Cart survives app restart

**Time:** 4-6 hours

---

## Story 2: Favorites System
**Priority:** P0 - Must Have
**Estimate:** 3 days
**Story Points:** 5

**User Story:**
*As a user, I want to save my favorite products so that I can easily find them later.*

**Acceptance Criteria:**
- [ ] User can tap heart icon to add/remove favorites
- [ ] Heart icon shows filled state for favorited items
- [ ] Favorites page displays all favorited products
- [ ] User can remove favorites from favorites page
- [ ] Favorites persist between sessions

---

### Day 6: Favorites Logic Implementation
**Tasks:**
- [ ] Open `lib/presentation/view_models/favorite_cubit/favorite_cubit.dart`
- [ ] Create `lib/presentation/view_models/favorite_cubit/favorite_state.dart`
- [ ] Define FavoriteState with: `List<ProductModel> favorites`, `Set<String> favoriteIds`
- [ ] Implement `toggleFavorite(ProductModel product)` method
- [ ] Implement `removeFavorite(String productId)` method
- [ ] Implement `isFavorite(String productId)` method returning bool
- [ ] Implement `clearFavorites()` method
- [ ] Register FavoriteCubit in `injection_container.dart`

**Deliverable:** Working FavoriteCubit with favorite operations

**Time:** 4-6 hours

---

### Day 7: Wire Heart Buttons & Favorites Page
**Tasks:**
- [ ] Open `lib/presentation/widgets/home_page/prdouct/product_item.dart`
- [ ] Inject FavoriteCubit using `context.read<FavoriteCubit>()`
- [ ] Wire heart button at line 85 to `favoriteCubit.toggleFavorite(productModel)`
- [ ] Use BlocBuilder to show filled/outline heart based on favorite state
- [ ] Add haptic feedback when toggling favorite
- [ ] Open `lib/presentation/pages/favorite_page.dart`
- [ ] Add BlocBuilder<FavoriteCubit, FavoriteState>
- [ ] Display favorite products in grid
- [ ] Show empty state when no favorites
- [ ] Add remove button on each favorite item

**Deliverable:** Favorites fully functional on all pages

**Time:** 6-8 hours

---

### Day 8: Favorites Persistence & Polish
**Tasks:**
- [ ] Update `LocalStorageService` to handle favorites
- [ ] Implement `saveFavorites(List<ProductModel> favorites)`
- [ ] Implement `loadFavorites()` returning `List<ProductModel>`
- [ ] Update FavoriteCubit to save on every change
- [ ] Load saved favorites in FavoriteCubit initialization
- [ ] Add "Added to favorites" / "Removed from favorites" snackbar
- [ ] Test persistence: favorite items, close app, reopen
- [ ] Make favorite products clickable to navigate to details

**Deliverable:** Favorites persist and work smoothly

**Time:** 4-6 hours

---

## Story 3: Bug Fixes & Polish
**Priority:** P0 - Must Have
**Estimate:** 2 days
**Story Points:** 3

---

### Day 9: Fix Discount Price Bug
**Tasks:**
- [ ] Open `lib/presentation/widgets/home_page/prdouct/product_item.dart`
- [ ] Fix line 66-74 to handle null discountPercentage
- [ ] Only show discount badge if `productModel.discountPercentage != null && productModel.discountPercentage! > 0`
- [ ] Handle case where productOriginalPrice is null
- [ ] Handle case where productOriginalPrice <= productPrice
- [ ] Test with real API data
- [ ] Add logging to see what discount values API returns
- [ ] Fix any similar issues in product_details_page.dart

**Deliverable:** Discount prices display correctly or hide when not applicable

**Time:** 2-4 hours

---

### Day 10: Week 1 Polish & Testing
**Tasks:**
- [ ] Add loading indicators to all cart operations
- [ ] Add error handling for cart/favorites operations
- [ ] Test cart with 0 items, 1 item, 10+ items
- [ ] Test favorites with 0 items, 1 item, 20+ items
- [ ] Ensure no crashes when tapping buttons quickly
- [ ] Check memory leaks (dispose cubits properly)
- [ ] Test on both Android and iOS if possible
- [ ] Fix any UI overflow issues
- [ ] Add pull-to-refresh on home page
- [ ] Clean up any console warnings

**Deliverable:** Stable Week 1 features, no critical bugs

**Time:** 6-8 hours

---

# WEEK 2: DISCOVERY FEATURES

## Story 4: Search Functionality
**Priority:** P1 - Should Have
**Estimate:** 3 days
**Story Points:** 5

**User Story:**
*As a user, I want to search for products by name so that I can quickly find what I need.*

**Acceptance Criteria:**
- [ ] User can tap search bar to open search page
- [ ] User can type search query
- [ ] Search results display as user types (with debouncing)
- [ ] User can tap search result to view product details
- [ ] Empty state shown when no results found
- [ ] Search history saved locally

---

### Day 11: Search State Management
**Tasks:**
- [ ] Create `lib/presentation/view_models/search_cubit/search_cubit.dart`
- [ ] Create `lib/presentation/view_models/search_cubit/search_state.dart`
- [ ] Define SearchState: SearchInitial, SearchLoading, SearchLoaded, SearchError
- [ ] SearchLoaded contains: `List<ProductModel> results`, `String query`
- [ ] Implement `search(String query)` method calling repository
- [ ] Add debouncing (wait 500ms after user stops typing)
- [ ] Implement `clearSearch()` method
- [ ] Register SearchCubit in DI container

**Deliverable:** SearchCubit with debounced search

**Time:** 4-6 hours

---

### Day 12: Search Page UI
**Tasks:**
- [ ] Create `lib/presentation/pages/search_page.dart`
- [ ] Add search text field at top
- [ ] Add BlocBuilder<SearchCubit, SearchState>
- [ ] Show loading indicator when SearchLoading
- [ ] Display results in grid when SearchLoaded
- [ ] Show "No results for '{query}'" when empty
- [ ] Make each result clickable to product details
- [ ] Add clear button on search field
- [ ] Add back button to return to home

**Deliverable:** Functional search page with results

**Time:** 6-8 hours

---

### Day 13: Wire Search Bar & Polish
**Tasks:**
- [ ] Open `lib/core/widgets/custom_search_bar.dart`
- [ ] Make search bar clickable (wrap with GestureDetector)
- [ ] Navigate to SearchPage when tapped
- [ ] Pass SearchCubit via BlocProvider to SearchPage
- [ ] Add search history using local storage (last 5 searches)
- [ ] Show search suggestions from history
- [ ] Add "Clear history" button
- [ ] Test search with various queries
- [ ] Handle special characters in search
- [ ] Add empty state illustration

**Deliverable:** Complete search flow working

**Time:** 4-6 hours

---

## Story 5: Category Filtering & See All
**Priority:** P1 - Should Have
**Estimate:** 3 days
**Story Points:** 5

**User Story:**
*As a user, I want to filter products by category so that I can browse specific types of products.*

**Acceptance Criteria:**
- [ ] User can tap category card to filter all product sections
- [ ] User can tap "See All" to view full product list
- [ ] Products reload when category changed
- [ ] Loading indicator shown during reload

---

### Day 14: Dynamic Category Filtering
**Tasks:**
- [ ] Open `lib/presentation/view_models/home_cubit/home_cubit.dart`
- [ ] Add `String selectedCategory` to HomeState
- [ ] Update `loadHomeData()` to accept optional category parameter
- [ ] Replace hard-coded 'electronics' at line 33 with dynamic category
- [ ] Add `filterByCategory(String category)` method
- [ ] Emit loading state when changing category
- [ ] Update category cards to be clickable
- [ ] Highlight selected category card

**Deliverable:** Categories filter products dynamically

**Time:** 4-6 hours

---

### Day 15: Product List Page (See All)
**Tasks:**
- [ ] Create `lib/presentation/view_models/product_list_cubit/product_list_cubit.dart`
- [ ] Create `lib/presentation/pages/product_list_page.dart`
- [ ] Accept parameters: section type (Best Sellers/Trending/Deals), category
- [ ] Load full product list based on section + category
- [ ] Display products in grid with pagination
- [ ] Add loading indicator at bottom when loading more
- [ ] Add filter/sort options (price, rating, newest)
- [ ] Add back button with section name in app bar

**Deliverable:** See All page with paginated results

**Time:** 6-8 hours

---

### Day 16: Wire See All Buttons
**Tasks:**
- [ ] Open `lib/presentation/pages/home_page.dart`
- [ ] Update onSeeAll at line 85 (Best Sellers) to navigate to ProductListPage
- [ ] Update onSeeAll at line 92 (Trending) to navigate to ProductListPage
- [ ] Update onSeeAll at line 101 (Hot Deals) to navigate to ProductListPage
- [ ] Pass section type and current category to ProductListPage
- [ ] Test navigation for all three sections
- [ ] Ensure cart and favorites work on ProductListPage too
- [ ] Add route to app_router.dart

**Deliverable:** All See All buttons navigate correctly

**Time:** 3-4 hours

---

## Story 6: Data Persistence Enhancement
**Priority:** P1 - Should Have
**Estimate:** 2 days
**Story Points:** 3

---

### Day 17: Complete Local Storage Service
**Tasks:**
- [ ] Open `lib/core/services/local_storage_service.dart`
- [ ] Add search history save/load methods
- [ ] Add last selected category save/load
- [ ] Add recently viewed products save/load
- [ ] Implement proper error handling for storage failures
- [ ] Add clear all data method
- [ ] Test storage limits (don't save too much data)
- [ ] Add data migration if needed

**Deliverable:** Robust local storage service

**Time:** 4-6 hours

---

### Day 18: Week 2 Polish & Testing
**Tasks:**
- [ ] Test search with slow network
- [ ] Test category switching rapidly
- [ ] Test See All with different categories
- [ ] Ensure all lists scroll smoothly
- [ ] Add error retry buttons on all pages
- [ ] Test with airplane mode (offline handling)
- [ ] Fix any performance issues
- [ ] Clean up commented code
- [ ] Update README with features

**Deliverable:** Stable Week 2 features

**Time:** 6-8 hours

---

# WEEK 3: USER FEATURES (OPTIONAL)

## Story 7: Firebase & Authentication Setup
**Priority:** P2 - Nice to Have
**Estimate:** 3 days
**Story Points:** 5

**User Story:**
*As a user, I want to create an account and login so that my data is saved across devices.*

**Acceptance Criteria:**
- [ ] User can sign up with email/password
- [ ] User can login with existing account
- [ ] User can logout
- [ ] Session persists between app restarts
- [ ] Error messages shown for invalid credentials

---

### Day 19: Firebase Setup
**Tasks:**
- [ ] Add Firebase packages to `pubspec.yaml`:
  - `firebase_core: ^3.0.0`
  - `firebase_auth: ^5.0.0`
  - `cloud_firestore: ^5.0.0`
- [ ] Run `flutter pub get`
- [ ] Create Firebase project at console.firebase.google.com
- [ ] Download `google-services.json` for Android
- [ ] Download `GoogleService-Info.plist` for iOS
- [ ] Initialize Firebase in `main.dart` before runApp
- [ ] Test Firebase connection

**Deliverable:** Firebase connected and initialized

**Time:** 3-4 hours

---

### Day 20: Authentication State Management
**Tasks:**
- [ ] Create `lib/presentation/view_models/auth_cubit/auth_cubit.dart`
- [ ] Create `lib/presentation/view_models/auth_cubit/auth_state.dart`
- [ ] Define states: AuthInitial, AuthLoading, AuthAuthenticated, AuthUnauthenticated, AuthError
- [ ] Implement `signUp(String email, String password)` using FirebaseAuth
- [ ] Implement `signIn(String email, String password)` using FirebaseAuth
- [ ] Implement `signOut()` method
- [ ] Implement `checkAuthStatus()` to restore session
- [ ] Register AuthCubit in DI container
- [ ] Add error handling for auth failures

**Deliverable:** AuthCubit with full authentication logic

**Time:** 6-8 hours

---

### Day 21: Login & Signup Pages
**Tasks:**
- [ ] Create `lib/presentation/pages/auth/login_page.dart`
- [ ] Add email and password text fields with validation
- [ ] Add "Login" button wired to AuthCubit
- [ ] Add "Don't have account? Sign Up" link
- [ ] Create `lib/presentation/pages/auth/signup_page.dart`
- [ ] Add name, email, password, confirm password fields
- [ ] Add password strength indicator
- [ ] Add "Sign Up" button wired to AuthCubit
- [ ] Show loading indicator during auth
- [ ] Show error messages from AuthError state
- [ ] Navigate to home after successful auth

**Deliverable:** Login and Signup pages functional

**Time:** 6-8 hours

---

## Story 8: User Profile & Settings
**Priority:** P2 - Nice to Have
**Estimate:** 2 days
**Story Points:** 3

---

### Day 22: Profile Page Implementation
**Tasks:**
- [ ] Open `lib/presentation/pages/profile_page.dart`
- [ ] Add BlocBuilder<AuthCubit, AuthState>
- [ ] Display user info (name, email) from FirebaseAuth
- [ ] Add avatar placeholder
- [ ] Add "My Orders" button (navigate to orders page)
- [ ] Add "Favorites" button (navigate to favorites page)
- [ ] Add "Settings" button
- [ ] Add "Logout" button wired to AuthCubit.signOut()
- [ ] Show login prompt if not authenticated
- [ ] Add edit profile option (future)

**Deliverable:** Functional profile page

**Time:** 4-6 hours

---

### Day 23: Splash Screen & Auth Flow
**Tasks:**
- [ ] Create `lib/presentation/pages/splash_page.dart`
- [ ] Add app logo and loading indicator
- [ ] Check auth status on splash screen
- [ ] Navigate to home if authenticated
- [ ] Navigate to login if not authenticated
- [ ] Update main.dart to start with splash screen
- [ ] Add 2 second minimum splash duration
- [ ] Test auth flow: signup -> logout -> login

**Deliverable:** Complete auth flow with splash screen

**Time:** 3-4 hours

---

## Story 9: Final Polish & Testing
**Priority:** P0 - Must Have
**Estimate:** 2 days
**Story Points:** 3

---

### Day 24: Integration Testing & Bug Fixes
**Tasks:**
- [ ] Test complete user journey: login -> browse -> search -> cart -> favorites -> logout
- [ ] Test offline scenarios
- [ ] Test with poor network connection
- [ ] Fix any crashes or bugs found
- [ ] Ensure all cubits dispose properly
- [ ] Check for memory leaks
- [ ] Test on different screen sizes
- [ ] Add loading states to all async operations
- [ ] Improve error messages to be user-friendly

**Deliverable:** App is stable and bug-free

**Time:** 6-8 hours

---

### Day 25: Final Polish & Documentation
**Tasks:**
- [ ] Remove all commented code
- [ ] Clean up console logs and debug prints
- [ ] Add app screenshots for README
- [ ] Update README with:
  - Features list
  - Screenshots
  - Setup instructions
  - Architecture overview
- [ ] Create demo video (30-60 seconds)
- [ ] Test on physical device
- [ ] Prepare APK for testing
- [ ] Code cleanup and formatting

**Deliverable:** Production-ready MVP with documentation

**Time:** 4-6 hours

---

# Sprint Metrics

## Velocity Tracking

| Week | Stories | Story Points | Status |
|------|---------|--------------|--------|
| Week 1 | 3 stories | 16 points | Core Shopping Features |
| Week 2 | 3 stories | 13 points | Discovery Features |
| Week 3 | 3 stories | 11 points | User Features (Optional) |

**Total Commitment: 40 Story Points in 2-3 weeks**

---

## Definition of Done

A story is considered DONE when:
- [ ] All tasks completed
- [ ] Code committed to git
- [ ] Feature tested on device
- [ ] No critical bugs
- [ ] Cubit registered in DI
- [ ] UI matches design expectations
- [ ] Works offline (if applicable)
- [ ] Error handling implemented

---

## Risk Management

### High Risks
1. **Firebase Setup Complexity** (Week 3)
   - *Mitigation:* Week 3 is optional, can skip if running out of time

2. **API Rate Limits**
   - *Mitigation:* Implement caching and local storage

3. **Scope Creep**
   - *Mitigation:* Stick to daily tasks, no additional features

### Medium Risks
1. **Learning Curve on Firebase**
   - *Mitigation:* Start Firebase setup early if attempting Week 3

2. **Testing Time**
   - *Mitigation:* Test daily, don't save testing for end

---

## Communication & Standups

### Daily Standup Questions
1. What did you complete yesterday?
2. What are you working on today?
3. Any blockers?

### End of Week Demo
- Demo working features to PM/team
- Get feedback
- Adjust next week if needed

---

## What If We Run Out of Time?

### 2-Week Scenario (Skip Week 3)
**Deliverable:** Functional shopping app with:
✅ Cart system
✅ Favorites
✅ Search
✅ Category filtering
✅ Persistence

**Result:** Strong portfolio project even without auth

### 3-Week Scenario (Complete All)
**Deliverable:** Full-featured e-commerce MVP with:
✅ Everything from 2 weeks
✅ User authentication
✅ Profile page
✅ Splash screen

**Result:** Production-ready portfolio project

---

## Success Criteria

### Minimum Viable Product (2 weeks)
- [ ] Users can browse products
- [ ] Users can search products
- [ ] Users can add to cart
- [ ] Users can favorite products
- [ ] Data persists between sessions
- [ ] No empty placeholder pages
- [ ] No crashes on common flows

### Extended MVP (3 weeks)
- [ ] All above +
- [ ] Users can create accounts
- [ ] Users can login/logout
- [ ] User profiles functional
- [ ] Professional onboarding

---

## Post-Sprint (Future Enhancements)

If time permits after sprint or for future iterations:
- Checkout flow with address input
- Order history in Firestore
- Dark mode
- Settings page
- Google/Facebook sign-in
- Product reviews
- Payment gateway
- Order tracking

**These are NOT in scope for the 2-3 week MVP**

---

## Developer Notes

### Tips for Success
1. **Complete one day at a time** - don't jump ahead
2. **Test immediately** after implementing each feature
3. **Commit daily** with clear commit messages
4. **Ask for help** if blocked for more than 2 hours
5. **Don't add features** not in the daily tasks
6. **Take breaks** - quality over speed

### Common Pitfalls to Avoid
- Starting Week 3 before Week 1 is complete
- Creating UI without wiring logic
- Skipping error handling
- Not testing on real device
- Adding "just one more feature"
- Saving all testing for the end

---

## Conclusion

This sprint plan gives you a **realistic path** to a portfolio-worthy e-commerce app in **2-3 weeks**.

**Week 1 is CRITICAL** - if cart and favorites don't work, nothing else matters.
**Week 2 is IMPORTANT** - search and filtering make it professional.
**Week 3 is OPTIONAL** - nice to have, but Week 1+2 is already impressive.

**Focus. Execute. Ship.**

Good luck! 🚀

---

*Created by: Senior Flutter Engineer & Product Manager*
*Sprint Start Date: [Add your start date]*
*Sprint End Date: [Add your deadline]*