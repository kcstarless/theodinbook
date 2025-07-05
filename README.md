# Odinbook 📘

A modern, full-stack social media application built with Ruby on Rails that provides comprehensive social networking features including posts, comments, likes, and user connections. The platform integrates OAuth authentication and real-time social interactions in a familiar Facebook-like interface.

## 🚀 Features

### 📱 **Social Media Core**
- **Post Creation & Management**: Create, edit, and delete posts with rich content
- **Real-time Interactions**: Like and comment on posts with instant feedback
- **Advanced Sorting**: Sort posts by recent, oldest, or most liked content
- **User Profiles**: Comprehensive user profiles with avatar management
- **Timeline Feed**: Personalized feed showing posts from followed users

### 👥 **Social Networking**
- **Follow System**: Send, accept, and reject follow requests
- **User Discovery**: Browse and search for other users
- **Social Connections**: Build your network through friend recommendations
- **Privacy Controls**: Manage who can see your posts and profile
- **Activity Tracking**: View likes, comments, and social interactions

### 🔐 **Authentication & Security**
- **Multi-Provider OAuth**: Sign in with GitHub and Google OAuth2
- **Secure Authentication**: Powered by Devise with robust session management
- **Email Verification**: Account verification and password recovery
- **Profile Customization**: Upload and manage profile avatars
- **Privacy Settings**: Control visibility and interaction permissions

### 💬 **Communication Features**
- **Threaded Comments**: Nested comment system for rich discussions
- **Like System**: Express appreciation for posts and comments
- **Real-time Updates**: Live notifications for social interactions
- **Rich Content**: Support for text formatting and media in posts

### 🎨 **User Experience**
- **Responsive Design**: Mobile-first design that works on all devices
- **Modern UI**: Clean, intuitive interface inspired by popular social platforms
- **Interactive Elements**: Smooth animations and real-time feedback
- **Customizable Profiles**: Personal branding with avatars and profile information

## 🛠️ Technology Stack

### **Backend**
- **Framework**: Ruby on Rails 7.1.3+
- **Database**: PostgreSQL
- **Authentication**: Devise + OAuth (GitHub, Google)
- **Server**: Puma
- **Background Jobs**: Rails Active Job
- **Email**: Action Mailer with Letter Opener for development

### **Frontend**
- **JavaScript**: Hotwire (Turbo + Stimulus)
- **CSS Framework**: Sass with custom styling
- **Build Tools**: esbuild for JavaScript bundling
- **Asset Pipeline**: Rails Asset Pipeline with Sprockets
- **Responsive Design**: Mobile-first CSS with Flexbox/Grid

### **Development & Testing**
- **Testing Framework**: RSpec with FactoryBot
- **Test Coverage**: Shoulda Matchers for model testing
- **Development Tools**: Pry for debugging
- **Code Quality**: Rails best practices and conventions

### **Deployment & Storage**
- **Containerization**: Docker with Dockerfile Rails
- **Cloud Storage**: AWS S3 for file uploads
- **Deployment**: Fly.io ready configuration
- **Environment**: Ruby 3.2.2, PostgreSQL

## 🏗️ Architecture

```
odinbook/
├── app/                    # Rails application logic
│   ├── controllers/        # Application controllers
│   │   ├── application_controller.rb     # Base controller
│   │   ├── posts_controller.rb           # Posts CRUD operations
│   │   ├── comments_controller.rb        # Comment management
│   │   ├── likes_controller.rb           # Like/unlike functionality
│   │   ├── follow_requests_controller.rb # Follow system
│   │   ├── users_controller.rb           # User discovery
│   │   └── users_profile_controller.rb   # Profile management
│   ├── models/             # Data models and business logic
│   │   ├── user.rb         # User model with Devise + OAuth
│   │   ├── post.rb         # Post model with validations
│   │   ├── comment.rb      # Comment threading system
│   │   ├── like.rb         # Like association model
│   │   └── follow_request.rb # Follow relationship model
│   ├── views/              # ERB templates and partials
│   │   ├── posts/          # Post-related views
│   │   ├── users/          # User management views
│   │   ├── comments/       # Comment display templates
│   │   ├── shared/         # Reusable partial templates
│   │   └── layouts/        # Application layout templates
│   ├── helpers/            # View helper methods
│   │   ├── application_helper.rb # Global helper methods
│   │   └── posts_helper.rb       # Post-specific helpers
│   ├── javascript/         # Stimulus controllers and JS
│   │   ├── application.js  # Main JavaScript entry point
│   │   ├── controllers/    # Stimulus JavaScript controllers
│   │   └── *.js           # Feature-specific JavaScript
│   └── assets/             # Stylesheets and static assets
│       ├── stylesheets/    # Sass/SCSS styling
│       └── images/         # Application images and icons
├── config/                 # Rails configuration
│   ├── routes.rb          # Application routing
│   ├── database.yml       # Database configuration
│   ├── devise.rb          # Authentication configuration
│   └── initializers/      # App initializers
├── db/                    # Database schema and migrations
│   ├── migrate/           # Database migration files
│   ├── schema.rb          # Current database schema
│   └── seeds.rb           # Sample data for development
└── spec/                  # RSpec test suite
    ├── models/            # Model unit tests
    ├── controllers/       # Controller tests
    ├── factories/         # FactoryBot test data
    └── rails_helper.rb    # RSpec configuration
```

## 🚦 Getting Started

### Prerequisites
- **Ruby**: 3.2.2+
- **PostgreSQL**: 12+
- **Node.js**: 16+ (for asset compilation)
- **OAuth Apps**: GitHub and/or Google OAuth applications (optional)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd odinbook
   ```

2. **Install dependencies**
   ```bash
   # Install Ruby gems
   bundle install
   
   # Install JavaScript dependencies
   yarn install
   # or
   npm install
   ```

3. **Database setup**
   ```bash
   # Create and setup database
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Environment configuration**
   Create `.env` file with OAuth credentials (optional):
   ```bash
   GITHUB_CLIENT_ID=your_github_client_id
   GITHUB_CLIENT_SECRET=your_github_client_secret
   GOOGLE_CLIENT_ID=your_google_client_id
   GOOGLE_CLIENT_SECRET=your_google_client_secret
   AWS_ACCESS_KEY_ID=your_aws_access_key
   AWS_SECRET_ACCESS_KEY=your_aws_secret_key
   AWS_REGION=your_aws_region
   AWS_BUCKET=your_s3_bucket_name
   ```

5. **Start the development server**
   ```bash
   # Start Rails server and asset compilation
   bin/dev
   # or manually start components:
   rails server &
   yarn build --watch &
   yarn build:css --watch
   ```

6. **Access the application**
   - Application: [http://localhost:3000](http://localhost:3000)
   - Email preview (development): [http://localhost:3000/letter_opener](http://localhost:3000/letter_opener)

### Available Scripts

```bash
# Development
bin/dev                   # Start all development services
rails server              # Start Rails server only
rails console             # Rails console for debugging
rails db:migrate          # Run pending migrations
rails db:seed             # Populate database with sample data

# Asset compilation
yarn build                # Build JavaScript assets
yarn build:css            # Compile Sass stylesheets
yarn build --watch        # Watch and rebuild JavaScript
yarn build:css --watch    # Watch and rebuild CSS

# Testing
rspec                     # Run all tests
rspec spec/models         # Run model tests only
rspec spec/controllers    # Run controller tests only
```

## 📊 Key Models & Relationships

### User Model
```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
end
```

### Post Model
```ruby
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :title, :body, presence: true
end
```

### Social Features
- **Follow System**: Users can send/receive follow requests
- **Like System**: Posts can be liked/unliked by users
- **Comment System**: Threaded comments on posts
- **Activity Feed**: Personalized timeline based on followed users

## 🎨 Design Features

### User Interface
- **Modern Layout**: Clean, card-based design with intuitive navigation
- **Responsive Grid**: Mobile-first responsive design using CSS Grid/Flexbox
- **Interactive Elements**: Hover effects, smooth transitions, and real-time feedback
- **Icon System**: Custom icons for social actions (likes, comments, follows)

### Social Features UI
- **Post Cards**: Visual post display with user avatars and timestamps
- **Sorting Controls**: Easy-to-use sorting options (recent, oldest, most liked)
- **User Profiles**: Comprehensive profile pages with avatar upload
- **Follow Buttons**: Clear follow/unfollow states with request management

## 🔧 Configuration

### OAuth Setup

**GitHub OAuth Application:**
1. Go to GitHub Settings → Developer settings → OAuth Apps
2. Create new OAuth App with callback URL: `http://localhost:3000/users/auth/github/callback`
3. Add credentials to `.env` file

**Google OAuth Application:**
1. Go to Google Cloud Console → APIs & Services → Credentials
2. Create OAuth 2.0 Client with redirect URI: `http://localhost:3000/users/auth/google_oauth2/callback`
3. Add credentials to `.env` file

### AWS S3 Configuration (Optional)
For production file uploads:
```bash
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
AWS_REGION=us-east-1
AWS_BUCKET=your-bucket-name
```

## 🧪 Testing

### Test Suite
The application uses RSpec with FactoryBot for comprehensive testing:

```bash
# Run all tests
rspec

# Run specific test types
rspec spec/models/user_spec.rb          # User model tests
rspec spec/controllers/posts_spec.rb    # Posts controller tests
rspec spec/factories/                   # Verify factory data

# Run with coverage
COVERAGE=true rspec
```

**Test Coverage Includes:**
- **Model Validations**: User, Post, Comment, Like models
- **Associations**: All model relationships and dependencies
- **Controller Actions**: CRUD operations and authentication
- **Authentication**: Devise integration and OAuth flows
- **Routing**: All application routes and nested resources

## 🚀 Deployment

### Fly.io Deployment
The application includes Fly.io configuration:

```bash
# Install Fly CLI and authenticate
flyctl auth login

# Deploy application
fly deploy

# Monitor deployment
fly status
fly logs
```

### Docker Support
```bash
# Build Docker image
docker build -t odinbook .

# Run container locally
docker run -p 3000:3000 -e DATABASE_URL=postgresql://... odinbook
```

### Environment Variables for Production
```bash
DATABASE_URL=postgresql://...
RAILS_MASTER_KEY=your_master_key
SECRET_KEY_BASE=your_secret_key_base
GITHUB_CLIENT_ID=your_github_client_id
GITHUB_CLIENT_SECRET=your_github_client_secret
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
```

## 🐛 Troubleshooting

### Common Issues

**Authentication Errors:**
- Verify OAuth application URLs match your domain
- Check that OAuth credentials are properly configured
- Ensure callback URLs are correctly set in provider settings

**Database Issues:**
```bash
# Reset database if needed
rails db:drop db:create db:migrate db:seed

# Check database connection
rails db:version
```

**Asset Compilation Errors:**
```bash
# Clear compiled assets
rm -rf app/assets/builds/*

# Rebuild assets
yarn build && yarn build:css

# Check for JavaScript errors
rails assets:precompile
```

**Email Configuration (Development):**
- Letter Opener should automatically open emails in browser
- Check `tmp/letter_opener/` for email previews
- Verify Action Mailer settings in `config/environments/development.rb`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing social feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Submit a pull request

### Development Guidelines
- Follow Rails conventions and RESTful design
- Write comprehensive tests for new features
- Use semantic commit messages
- Update documentation for new features
- Ensure responsive design for mobile compatibility

## 📝 License

This project is part of The Odin Project curriculum, demonstrating modern Ruby on Rails development practices for social media applications.

## 🏆 Key Achievements

- ✅ **Full Social Platform**: Complete social media functionality
- ✅ **Multi-Auth Integration**: GitHub and Google OAuth support  
- ✅ **Real-time Interactions**: Live likes, comments, and follows
- ✅ **Modern Rails Architecture**: Rails 7 with Hotwire and Stimulus
- ✅ **Responsive Design**: Mobile-first responsive interface
- ✅ **Production Ready**: Docker and Fly.io deployment configuration
- ✅ **Comprehensive Testing**: RSpec test suite with high coverage
- ✅ **Security Best Practices**: Devise authentication with CSRF protection

## 📱 Features Showcase

### Core Social Features
- **📝 Post Management**: Create, edit, delete posts with rich content
- **💬 Comment System**: Threaded comments with real-time updates
- **❤️ Like System**: Express appreciation with instant feedback
- **👥 Follow System**: Build connections through follow requests
- **📊 Content Sorting**: Sort by recent, oldest, or most popular
- **👤 User Profiles**: Customizable profiles with avatar uploads

### Technical Highlights
- **🔐 OAuth Integration**: Seamless GitHub and Google sign-in
- **📱 Responsive UI**: Works beautifully on all screen sizes
- **⚡ Hotwire**: Modern SPA-like experience without complex JavaScript
- **🎨 Custom Styling**: Beautiful, modern interface with Sass
- **📧 Email System**: Automated notifications and confirmations
- **☁️ Cloud Ready**: AWS S3 integration for file storage

---

**Built with ❤️ using Ruby on Rails, Hotwire, and modern web development practices**

*Part of The Odin Project - Ruby on Rails curriculum*
