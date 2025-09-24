import React, { useEffect, useState } from 'react';

const Toast = ({ 
  message, 
  type = 'info', 
  duration = 4000, 
  onClose,
  position = 'top-right',
  icon = null 
}) => {
  const [isVisible, setIsVisible] = useState(false);
  const [isLeaving, setIsLeaving] = useState(false);

  useEffect(() => {
    // Animazione di entrata
    const timer = setTimeout(() => setIsVisible(true), 100);
    
    // Auto-close
    const autoCloseTimer = setTimeout(() => {
      handleClose();
    }, duration);

    return () => {
      clearTimeout(timer);
      clearTimeout(autoCloseTimer);
    };
  }, [duration]);

  const handleClose = () => {
    setIsLeaving(true);
    setTimeout(() => {
      onClose?.();
    }, 300);
  };

  const getTypeStyles = () => {
    switch (type) {
      case 'success':
        return {
          bg: 'bg-gradient-to-r from-green-600 to-green-500',
          border: 'border-green-500',
          icon: icon || '✅',
          glow: 'hover:shadow-green-500/25'
        };
      case 'error':
        return {
          bg: 'bg-gradient-to-r from-red-600 to-red-500',
          border: 'border-red-500',
          icon: icon || '❌',
          glow: 'hover:shadow-red-500/25'
        };
      case 'warning':
        return {
          bg: 'bg-gradient-to-r from-yellow-600 to-yellow-500',
          border: 'border-yellow-500',
          icon: icon || '⚠️',
          glow: 'hover:shadow-yellow-500/25'
        };
      case 'info':
        return {
          bg: 'bg-gradient-to-r from-blue-600 to-blue-500',
          border: 'border-blue-500',
          icon: icon || 'ℹ️',
          glow: 'hover:shadow-blue-500/25'
        };
      default:
        return {
          bg: 'bg-gradient-to-r from-dark-700 to-dark-600',
          border: 'border-dark-500',
          icon: icon || '📢',
          glow: 'hover:shadow-dark-500/25'
        };
    }
  };

  const getPositionStyles = () => {
    switch (position) {
      case 'top-left':
        return 'top-4 left-4';
      case 'top-center':
        return 'top-4 left-1/2 transform -translate-x-1/2';
      case 'top-right':
        return 'top-4 right-4';
      case 'bottom-left':
        return 'bottom-4 left-4';
      case 'bottom-center':
        return 'bottom-4 left-1/2 transform -translate-x-1/2';
      case 'bottom-right':
        return 'bottom-4 right-4';
      default:
        return 'top-4 right-4';
    }
  };

  const styles = getTypeStyles();
  const positionStyles = getPositionStyles();

  return (
    <div
      className={`
        fixed ${positionStyles} z-50 max-w-sm w-full
        transform transition-all duration-300 ease-in-out
        ${isVisible && !isLeaving ? 'translate-y-0 opacity-100 scale-100' : 'translate-y-2 opacity-0 scale-95'}
      `}
    >
      <div
        className={`
          ${styles.bg} ${styles.border} border-2 rounded-xl shadow-xl backdrop-blur-sm
          p-4 flex items-center space-x-3 text-white font-medium
          hover:scale-105 transition-transform duration-200 cursor-pointer
          ${styles.glow}
        `}
        onClick={handleClose}
      >
        <div className="text-2xl flex-shrink-0">
          {styles.icon}
        </div>
        
        <div className="flex-1 min-w-0">
          <p className="text-sm leading-relaxed break-words">
            {message}
          </p>
        </div>
        
        <button
          onClick={(e) => {
            e.stopPropagation();
            handleClose();
          }}
          className="flex-shrink-0 p-1 hover:bg-white/20 rounded-lg transition-colors duration-200"
        >
          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </div>
  );
};

export default Toast;
