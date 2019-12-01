library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( 
            RXD : in  STD_LOGIC;
			   TXD : out STD_LOGIC;
            CLOCK : in  STD_LOGIC;
				LED : out  STD_LOGIC);
end main;

architecture Behavioral of main is

	 signal reset 			: STD_LOGIC := '1';
    signal rxd_signal  : STD_LOGIC;
    signal txd_signal  : STD_LOGIC;
    signal eoc         : STD_LOGIC; 
    signal eot         : STD_LOGIC; 
    signal wr          : STD_LOGIC;
    signal ready       : STD_LOGIC;	
    signal outp        : STD_LOGIC_VECTOR(7 downto 0);
    signal inp		   : STD_LOGIC_VECTOR(7 downto 0);

begin
	 
	 rxd_signal <= RXD;
    TXD <= txd_signal;

    serial: entity work.Minimal_UART_CORE 
		port map(
			CLOCK => clock, 
			EOC => eoc, 
			OUTP => outp, 
			RXD => rxd_signal, 
			TXD => txd_signal, 
			EOT => eot, 
			INP => "00000110", 
			READY => ready, 
			WR => wr
        );

    SerialCtrl: process(eoc) 
    begin
        if (eoc = '1') then
				wr <= '1';
				
            case outp is
                when X"A0" | "00001100" | "00110000" => 
                    LED <= '1';
                    reset <= '0';
                when X"A1" | "10001100" | "00110001" => 
                    LED <= '0';
                    reset <= '0';                    
                when X"A2" | "01001100" | "00110010" => 
                    LED <= '1';
                    reset <= '0';
                when X"A3" | "00101100" | "00110011" => 
                    LED <= '0';
                    reset <= '1';
				when others =>
            end case;	
        else
            wr <= '0';        
        end if;
    end process; 

   

end Behavioral;

