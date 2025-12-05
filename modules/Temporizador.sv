module Temporizador(
	input logic PAUSE,
	input logic RESET,
	input logic CLOCK, // milisegundos
	output logic [0:3] DECIMOS,
	output logic [0:3] SEGUNDOS_UNIDADE,
	output logic [0:3] SEGUNDOS_DECIMOS,
	output logic [0:3] MINUTOS,
	output logic TEMPO_ACABOU
);
// João: olhando o esquema geral do projeto, o KEY[0]
// é o START (ativo em 1), mas está ligado no RESET.
// Por isso, vou construir o módulo assuMINUTOSdo que RESET = START.
   logic running;

    always_ff @(posedge CLOCK) begin
    // --------------------------------------------------
    // CONTROLE STOP / RESET
    // --------------------------------------------------
			if (RESET)
            running <= 1'b1;
        else if (PAUSE)
            running <= 1'b0;
				
    // --------------------------------------------------
    // CONTAGEM DE TEMPO EM BINÁRIO
    // --------------------------------------------------
        if (RESET) begin
            DECIMOS <= 0;
            SEGUNDOS_UNIDADE <= 9;
            SEGUNDOS_DECIMOS <= 5;
            MINUTOS <= 2;
				TEMPO_ACABOU <= 0;
        end
        else if (running) begin

            // SATURA EM 2:00,000
            if (MINUTOS == 0 && SEGUNDOS_DECIMOS == 0 && SEGUNDOS_UNIDADE == 0 && DECIMOS == 0) begin
                running <= 0;
					 TEMPO_ACABOU <= 1;
            end
            else begin
						if (DECIMOS == 0) begin
							 DECIMOS <= 9;

							 if (SEGUNDOS_UNIDADE == 0) begin
								  SEGUNDOS_UNIDADE <= 9;

								  if (SEGUNDOS_DECIMOS == 0) begin
										SEGUNDOS_DECIMOS <= 5;

										MINUTOS <= MINUTOS - 1;
								  end
								  else begin
										SEGUNDOS_DECIMOS <= SEGUNDOS_DECIMOS - 1;
								  end

							 end
							 else begin
								  SEGUNDOS_UNIDADE <= SEGUNDOS_UNIDADE - 1;
							 end
						end
						else begin
							 DECIMOS <= DECIMOS - 1;
						end
            end
        end
    end

endmodule