import React from 'react';

const Input = ({ 
  label,
  error,
  helperText,
  icon,
  iconPosition = 'left',
  className = '',
  ...props 
}) => {
  const baseClasses = 'w-full px-4 py-3 bg-dark-700 border border-dark-600 rounded-lg text-dark-100 placeholder-dark-400 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200';
  
  const errorClasses = error ? 'border-red-500 focus:ring-red-500 focus:border-red-500' : '';
  
  const iconClasses = icon ? (iconPosition === 'left' ? 'pl-12' : 'pr-12') : '';
  
  const classes = `${baseClasses} ${errorClasses} ${iconClasses} ${className}`;
  
  return (
    <div className="w-full">
      {label && (
        <label className="block text-sm font-medium text-dark-200 mb-2">
          {label}
        </label>
      )}
      
      <div className="relative">
        {icon && iconPosition === 'left' && (
          <div className="absolute left-4 top-1/2 transform -translate-y-1/2 text-dark-400">
            {icon}
          </div>
        )}
        
        <input
          className={classes}
          {...props}
        />
        
        {icon && iconPosition === 'right' && (
          <div className="absolute right-4 top-1/2 transform -translate-y-1/2 text-dark-400">
            {icon}
          </div>
        )}
      </div>
      
      {error && (
        <p className="mt-2 text-sm text-red-400">
          {error}
        </p>
      )}
      
      {helperText && !error && (
        <p className="mt-2 text-sm text-dark-400">
          {helperText}
        </p>
      )}
    </div>
  );
};

export default Input;
