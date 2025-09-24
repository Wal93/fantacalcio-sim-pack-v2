import React from 'react';

const Card = ({ 
  children, 
  className = '', 
  hover = false, 
  padding = 'md',
  variant = 'default',
  premium = false,
  animated = false,
  ...props 
}) => {
  const baseClasses = `rounded-xl border transition-all duration-300 shadow-lg backdrop-blur-sm ${animated ? 'animate-fadeIn' : ''}`;
  
  const variants = {
    default: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-dark-700 shadow-dark-900/50',
    glass: 'glass-effect border-dark-600/50 shadow-xl',
    primary: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-primary-600/50 shadow-primary-900/20',
    success: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-green-600/50 shadow-green-900/20',
    warning: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-yellow-600/50 shadow-yellow-900/20',
    danger: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-red-600/50 shadow-red-900/20',
    info: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-blue-600/50 shadow-blue-900/20',
    premium: 'card-premium',
    trophy: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-yellow-600/50 shadow-yellow-900/20 trophy-glow',
    stadium: 'bg-gradient-to-br from-dark-800/90 to-dark-900/90 border-primary-600/50 shadow-primary-900/20 stadium-glow field-pattern'
  };
  
  const paddings = {
    none: '',
    sm: 'p-4',
    md: 'p-6',
    lg: 'p-8',
    xl: 'p-10'
  };
  
  const hoverClasses = hover ? 'hover:shadow-2xl hover:scale-[1.02] hover:-translate-y-1 cursor-pointer hover-lift-smooth' : '';
  const premiumClasses = premium ? 'card-premium' : '';
  
  const classes = `${baseClasses} ${variants[variant]} ${paddings[padding]} ${hoverClasses} ${premiumClasses} ${className}`;
  
  return (
    <div className={classes} {...props}>
      {children}
    </div>
  );
};

const CardHeader = ({ children, className = '', ...props }) => (
  <div className={`mb-4 ${className}`} {...props}>
    {children}
  </div>
);

const CardTitle = ({ children, className = '', ...props }) => (
  <h3 className={`text-xl font-bold text-dark-100 ${className}`} {...props}>
    {children}
  </h3>
);

const CardDescription = ({ children, className = '', ...props }) => (
  <p className={`text-dark-400 text-sm ${className}`} {...props}>
    {children}
  </p>
);

const CardContent = ({ children, className = '', ...props }) => (
  <div className={className} {...props}>
    {children}
  </div>
);

const CardFooter = ({ children, className = '', ...props }) => (
  <div className={`mt-4 pt-4 border-t border-dark-700 ${className}`} {...props}>
    {children}
  </div>
);

Card.Header = CardHeader;
Card.Title = CardTitle;
Card.Description = CardDescription;
Card.Content = CardContent;
Card.Footer = CardFooter;

export default Card;
