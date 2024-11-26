import React, { useState, useRef, useEffect } from "react";

interface ChatbotProps {
  // Props for Chatbot (if needed in the future)
}

const Chatbot: React.FC<ChatbotProps> = () => {
  const [showChat, setShowChat] = useState(false);
  const [messages, setMessages] = useState<
    { text: string; sender: string; timestamp: number }[]
  >([]);
  const [input, setInput] = useState("");
  const chatBodyRef = useRef<HTMLDivElement>(null); // Ref for auto-scrolling

  // Auto-scroll to the latest message
  useEffect(() => {
    if (chatBodyRef.current) {
      chatBodyRef.current.scrollTop = chatBodyRef.current.scrollHeight;
    }
  }, [messages]);

  // Handle sending messages
  const handleSendMessage = () => {
    if (input.trim() === "") return; // Prevent sending empty messages

    // User message
    const userMessage = {
      text: input,
      sender: "user",
      timestamp: Date.now(),
    };

    setMessages((prevMessages) => [...prevMessages, userMessage]);
    setInput("");

    // Simulated bot response after a delay
    setTimeout(() => {
      const botMessage = {
        text: `Bot: You said "${input}"`,
        sender: "bot",
        timestamp: Date.now(),
      };
      setMessages((prevMessages) => [...prevMessages, botMessage]);
    }, 1000); // 1-second delay
  };

  return (
    <div className="chatbot-container">
      {/* Open Chat Button */}
      {!showChat && (
        <button
          className="open-chat-button"
          onClick={() => setShowChat(true)}
        ></button>
      )}

      {/* Chat Window */}
      {showChat && (
        <div className="chat-window">
          {/* Chat Header */}
          <div className="chat-header">
            <h2>Trợ Lý Ảo VietHistory</h2>
            <button className="close-button" onClick={() => setShowChat(false)}>
              ×
            </button>
          </div>

          {/* Chat Body */}
          <div className="chat-body" ref={chatBodyRef}>
            <ul>
              {messages.map((message, index) => (
                <li
                  key={index}
                  className={`message ${
                    message.sender === "user" ? "user-message" : "bot-message"
                  }`}
                >
                  {message.text}
                </li>
              ))}
            </ul>
          </div>

          {/* Input Container */}
          <div className="input-container">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              placeholder="Nhập tin nhắn..."
              className="chat-input"
            />
            <button onClick={handleSendMessage} className="chat-button">
              Gửi
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default Chatbot;
