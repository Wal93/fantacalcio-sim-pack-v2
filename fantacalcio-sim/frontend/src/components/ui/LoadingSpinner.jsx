import React from 'react';

const LoadingSpinner = ({ 
  size = 'md', 
  color = 'primary',
  text = '',
  className = '' 
}) => {
  const sizes = {
    sm: 'w-4 h-4',
    md: 'w-8 h-8',
    lg: 'w-12 h-12',
    xl: 'w-16 h-16'
  };
  
  const colors = {
    primary: 'border-primary-500',
    white: 'border-white',
    dark: 'border-dark-400'
  };
  
  return (
    <div className={`flex flex-col items-center justify-center ${className}`}>
      <div className={`${sizes[size]} border-4 border-transparent border-t-4 rounded-full animate-spin ${colors[color]}`} />
      {text && (
        <p className="mt-3 text-dark-400 text-sm">
          {text}
        </p>
      )}
    </div>
  );
};

export default LoadingSpinner;
