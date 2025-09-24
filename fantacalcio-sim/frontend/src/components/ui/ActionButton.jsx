import React from 'react';

const ActionButton = ({ 
  title, 
  subtitle, 
  icon, 
  onClick, 
  variant = 'primary',
  size = 'lg',
  disabled = false,
  loading = false,
  className = '',
  ...props 
}) => {
  const getVariantStyles = () => {
    switch (variant) {
      case 'primary':
        return 'bg-gradient-to-r from-primary-600 to-primary-500 hover:from-primary-700 hover:to-primary-600 text-white shadow-lg hover:shadow-xl hover:shadow-primary-500/25';
      case 'secondary':
        return 'bg-gradient-to-r from-purple-600 to-purple-500 hover:from-purple-700 hover:to-purple-600 text-white shadow-lg hover:shadow-xl hover:shadow-purple-500/25';
      case 'success':
        return 'bg-gradient-to-r from-green-600 to-green-500 hover:from-green-700 hover:to-green-600 text-white shadow-lg hover:shadow-xl hover:shadow-green-500/25';
      case 'warning':
        return 'bg-gradient-to-r from-yellow-600 to-yellow-500 hover:from-yellow-700 hover:to-yellow-600 text-black shadow-lg hover:shadow-xl hover:shadow-yellow-500/25';
      case 'info':
        return 'bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-700 hover:to-blue-600 text-white shadow-lg hover:shadow-xl hover:shadow-blue-500/25';
      case 'danger':
        return 'bg-gradient-to-r from-red-600 to-red-500 hover:from-red-700 hover:to-red-600 text-white shadow-lg hover:shadow-xl hover:shadow-red-500/25';
      case 'outline':
        return 'bg-transparent border-2 border-primary-600 text-primary-400 hover:bg-primary-600 hover:text-white shadow-lg hover:shadow-xl hover:shadow-primary-500/25';
      default:
        return 'bg-gradient-to-r from-dark-700 to-dark-600 hover:from-dark-600 hover:to-dark-500 text-dark-100 shadow-lg hover:shadow-xl';
    }
  };

  const getSizeStyles = () => {
    switch (size) {
      case 'sm':
        return 'h-16 px-4';
      case 'md':
        return 'h-20 px-6';
      case 'lg':
        return 'h-24 px-8';
      case 'xl':
        return 'h-28 px-10';
      default:
        return 'h-24 px-8';
    }
  };

  return (
    <button
      onClick={onClick}
      disabled={disabled || loading}
      className={`
        relative overflow-hidden rounded-xl transition-all duration-300
        focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-dark-900
        disabled:opacity-50 disabled:cursor-not-allowed
        transform hover:scale-105 active:scale-95
        ${getVariantStyles()}
        ${getSizeStyles()}
        ${className}
      `}
      {...props}
    >
      {/* Shimmer effect */}
      <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/20 to-transparent opacity-0 hover:opacity-100 transition-opacity duration-500 transform -skew-x-12 -translate-x-full hover:translate-x-full"></div>
      
      {/* Content */}
      <div className="relative z-10 flex flex-col items-center justify-center h-full space-y-1">
        {loading ? (
          <div className="spinner" />
        ) : (
          <>
            <div className="text-2xl mb-1">
              {icon}
            </div>
            <div className="text-center">
              <div className="font-bold text-sm leading-tight">
                {title}
              </div>
              {subtitle && (
                <div className="text-xs opacity-90 leading-tight">
                  {subtitle}
                </div>
              )}
            </div>
          </>
        )}
      </div>
      
      {/* Glow effect */}
      <div className="absolute inset-0 rounded-xl opacity-0 hover:opacity-100 transition-opacity duration-300 bg-gradient-to-r from-transparent via-white/10 to-transparent"></div>
    </button>
  );
};

export default ActionButton;
