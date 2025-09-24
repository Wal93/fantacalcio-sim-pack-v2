import React from 'react';

const StatCard = ({ 
  title, 
  value, 
  icon, 
  trend = null, 
  color = 'primary',
  animated = true,
  delay = 0,
  className = '',
  ...props 
}) => {
  const getColorStyles = () => {
    switch (color) {
      case 'primary':
        return {
          icon: 'text-gradient',
          value: 'text-gradient',
          bg: 'bg-gradient-to-br from-primary-600/20 to-primary-500/10',
          border: 'border-primary-600/30'
        };
      case 'success':
        return {
          icon: 'text-green-400',
          value: 'text-green-400',
          bg: 'bg-gradient-to-br from-green-600/20 to-green-500/10',
          border: 'border-green-600/30'
        };
      case 'warning':
        return {
          icon: 'text-gradient-gold',
          value: 'text-gradient-gold',
          bg: 'bg-gradient-to-br from-yellow-600/20 to-yellow-500/10',
          border: 'border-yellow-600/30'
        };
      case 'info':
        return {
          icon: 'text-gradient-blue',
          value: 'text-gradient-blue',
          bg: 'bg-gradient-to-br from-blue-600/20 to-blue-500/10',
          border: 'border-blue-600/30'
        };
      case 'danger':
        return {
          icon: 'text-red-400',
          value: 'text-red-400',
          bg: 'bg-gradient-to-br from-red-600/20 to-red-500/10',
          border: 'border-red-600/30'
        };
      default:
        return {
          icon: 'text-dark-300',
          value: 'text-dark-300',
          bg: 'bg-gradient-to-br from-dark-600/20 to-dark-500/10',
          border: 'border-dark-600/30'
        };
    }
  };

  const styles = getColorStyles();

  const getTrendIcon = () => {
    if (!trend) return null;
    
    if (trend > 0) {
      return (
        <div className="flex items-center text-green-400 text-sm">
          <svg className="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 17l9.2-9.2M17 17V7H7" />
          </svg>
          +{trend}%
        </div>
      );
    } else if (trend < 0) {
      return (
        <div className="flex items-center text-red-400 text-sm">
          <svg className="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 7l-9.2 9.2M7 7v10h10" />
          </svg>
          {trend}%
        </div>
      );
    }
    return null;
  };

  return (
    <div
      className={`
        relative overflow-hidden rounded-xl border backdrop-blur-sm
        ${styles.bg} ${styles.border}
        p-6 transition-all duration-300 hover:scale-105 hover:shadow-xl
        ${animated ? 'animate-slideInUp' : ''}
        ${className}
      `}
      style={{ animationDelay: `${delay}s` }}
      {...props}
    >
      {/* Background pattern */}
      <div className="absolute inset-0 opacity-5">
        <div className="absolute top-0 right-0 w-20 h-20 bg-current rounded-full -translate-y-10 translate-x-10"></div>
        <div className="absolute bottom-0 left-0 w-16 h-16 bg-current rounded-full translate-y-8 -translate-x-8"></div>
      </div>
      
      {/* Content */}
      <div className="relative z-10">
        <div className="flex items-center justify-between mb-4">
          <div className={`text-3xl ${styles.icon}`}>
            {icon}
          </div>
          {getTrendIcon()}
        </div>
        
        <div className="space-y-2">
          <div className={`text-3xl font-bold ${styles.value}`}>
            {value}
          </div>
          <div className="text-dark-400 font-medium text-sm">
            {title}
          </div>
        </div>
      </div>
      
      {/* Hover effect */}
      <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/5 to-transparent opacity-0 hover:opacity-100 transition-opacity duration-300"></div>
    </div>
  );
};

export default StatCard;
